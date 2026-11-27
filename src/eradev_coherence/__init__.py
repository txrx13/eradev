"""EraDev Multi-Agent Coherence & Phantom-Coherence Detection Toolkit."""

from .metrics import (
    ROLES_QUINTET,
    AgentScore,
    RoundTableVerdict,
    compute_b_score,
    compute_s_adjusted,
    compute_s_team,
    detect_phantom_coherence,
    evaluate_round_table,
)

__all__ = [
    "ROLES_QUINTET",
    "AgentScore",
    "RoundTableVerdict",
    "compute_b_score",
    "compute_s_team",
    "compute_s_adjusted",
    "detect_phantom_coherence",
    "evaluate_round_table",
]
