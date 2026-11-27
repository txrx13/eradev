import unittest

from eradev_coherence import (
    AgentScore,
    compute_b_score,
    compute_s_adjusted,
    compute_s_team,
    detect_phantom_coherence,
    evaluate_round_table,
)


class TestEraDevCoherence(unittest.TestCase):
    def test_zero_gate_property(self) -> None:
        self.assertEqual(compute_b_score(0.95, 0.90, 0.10, 0.0), 0.0)
        self.assertEqual(compute_b_score(0.95, 0.90, 1.0, 0.90), 0.0)

    def test_unanimous_low_quality_triggers_phantom_coherence(self) -> None:
        b_scores = [0.10, 0.10, 0.10, 0.10, 0.10]
        b_bar, s_team, s_adj = compute_s_adjusted(b_scores)
        self.assertAlmostEqual(s_team, 1.0)
        self.assertAlmostEqual(b_bar, 0.10)
        self.assertAlmostEqual(s_adj, 0.10)
        self.assertTrue(detect_phantom_coherence(s_team, s_adj))

    def test_leti_rank_inversion(self) -> None:
        ru_b = [0.331, 0.361, 0.340, 0.358, 0.340]
        en_b = [0.542, 0.528, 0.556, 0.519, 0.425]
        b_ru, s_ru, sadj_ru = compute_s_adjusted(ru_b)
        b_en, s_en, sadj_en = compute_s_adjusted(en_b)
        self.assertGreater(s_ru, s_en)
        self.assertGreater(sadj_en, sadj_ru)
        self.assertTrue(detect_phantom_coherence(s_ru, sadj_ru))

    def test_round_table_high_coherence_passes_without_escalation(self) -> None:
        cohort = [
            AgentScore("visionary", F=0.94, E=0.92, sigma=0.05, lam=0.95),
            AgentScore("analyst", F=0.93, E=0.94, sigma=0.06, lam=0.94),
            AgentScore("builder", F=0.95, E=0.93, sigma=0.04, lam=0.95),
            AgentScore("validator", F=0.92, E=0.95, sigma=0.05, lam=0.93),
            AgentScore("coherent", F=0.94, E=0.94, sigma=0.05, lam=0.94),
        ]
        verdict = evaluate_round_table(cohort)
        self.assertFalse(verdict.phantom_coherence)
        self.assertFalse(verdict.escalate_to_human)
        self.assertGreater(verdict.s_adjusted, 0.72)


if __name__ == "__main__":
    unittest.main()
