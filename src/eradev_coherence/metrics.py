"""Formal multi-agent coherence metrics for EraDev LLM teams.

Implements Equations (1)-(3) from:
  A. S. Pankratov (2026), "Multi-Agent Coherence in Artificial Intelligence Systems:
  An Empirical Study of the EraDev Framework Across 25 Agents", ETU "LETI" NNB-2026,
  and DOI: 10.32743/UniTech.2026.147.6.22875.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Sequence, Tuple

ROLES_QUINTET: Tuple[str, ...] = (
    "visionary",
    "analyst",
    "builder",
    "validator",
    "coherent",
)


def _clamp01(value: float, name: str) -> float:
    if not (0.0 <= value <= 1.0):
        raise ValueError(f"{name} must lie in [0.0, 1.0], got {value}")
    return float(value)


def compute_b_score(
    F: float,
    E: float,
    sigma: float,
    lam: float,
    weights: Tuple[float, float, float, float] = (1.0, 1.0, 1.0, 1.0),
) -> float:
    """Compute agent or artifact coherence score B = F^w1 * E^w2 * (1 - sigma)^w3 * Lambda^w4."""
    f_v = _clamp01(F, "F")
    e_v = _clamp01(E, "E")
    s_v = _clamp01(sigma, "sigma")
    l_v = _clamp01(lam, "lam")
    w1, w2, w3, w4 = weights
    if any(w < 0 for w in weights) or sum(weights) <= 0:
        raise ValueError("weights must be non-negative with positive sum")
    if 0.0 in (f_v, e_v, 1.0 - s_v, l_v):
        return 0.0
    return (f_v ** w1) * (e_v ** w2) * ((1.0 - s_v) ** w3) * (l_v ** w4)


@dataclass(frozen=True)
class AgentScore:
    """Structured rubric evaluation emitted by an EraDev role agent."""

    role: str
    F: float
    E: float
    sigma: float
    lam: float

    @property
    def b_score(self) -> float:
        return compute_b_score(self.F, self.E, self.sigma, self.lam)


@dataclass(frozen=True)
class RoundTableVerdict:
    """Aggregated Round-Table coherence diagnostics and escalation gate decision."""

    n_agents: int
    b_scores: Tuple[float, ...]
    b_bar: float
    s_team: float
    s_adjusted: float
    phantom_coherence: bool
    escalate_to_human: bool


def compute_s_team(b_scores: Sequence[float]) -> float:
    """Pairwise inter-agent agreement: S_team = 1 - (2 / (n*(n-1))) * sum_{i<j} |B_i - B_j|."""
    n = len(b_scores)
    if n == 0:
        raise ValueError("b_scores must be non-empty")
    for idx, b in enumerate(b_scores):
        _clamp01(b, f"b_scores[{idx}]")
    if n == 1:
        return 1.0
    diff_sum = 0.0
    for i in range(n):
        for j in range(i + 1, n):
            diff_sum += abs(b_scores[i] - b_scores[j])
    return max(0.0, 1.0 - (2.0 / (n * (n - 1))) * diff_sum)


def compute_s_adjusted(b_scores: Sequence[float]) -> Tuple[float, float, float]:
    """Return (b_bar, s_team, s_adjusted) where S_adjusted = S_team * B_bar."""
    s_team = compute_s_team(b_scores)
    b_bar = sum(b_scores) / len(b_scores)
    return b_bar, s_team, s_team * b_bar


def detect_phantom_coherence(
    s_team: float,
    s_adjusted: float,
    agreement_threshold: float = 0.70,
    quality_floor: float = 0.50,
) -> bool:
    """Detect collective agreement around a low-quality solution (S_team > 0.70 and S_adjusted < 0.50)."""
    return s_team > agreement_threshold and s_adjusted < quality_floor


def evaluate_round_table(
    agents: Sequence[AgentScore],
    agreement_threshold: float = 0.70,
    quality_floor: float = 0.50,
    escalation_b_floor: float = 0.72,
) -> RoundTableVerdict:
    """Evaluate a multi-agent Round-Table cohort and trigger escalation on phantom coherence."""
    if not agents:
        raise ValueError("agents must be non-empty")
    b_tuple = tuple(a.b_score for a in agents)
    b_bar, s_team, s_adj = compute_s_adjusted(b_tuple)
    phantom = detect_phantom_coherence(s_team, s_adj, agreement_threshold, quality_floor)
    escalate = phantom or (b_bar < escalation_b_floor)
    return RoundTableVerdict(
        n_agents=len(b_tuple),
        b_scores=b_tuple,
        b_bar=round(b_bar, 6),
        s_team=round(s_team, 6),
        s_adjusted=round(s_adj, 6),
        phantom_coherence=phantom,
        escalate_to_human=escalate,
    )
