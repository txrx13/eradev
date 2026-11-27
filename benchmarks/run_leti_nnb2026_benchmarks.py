#!/usr/bin/env python3
"""Reproduce multi-agent coherence inversions from ETU "LETI" NNB-2026 (Table 3 & Exp. 3)."""

from eradev_coherence.metrics import compute_s_adjusted, detect_phantom_coherence


def main() -> None:
    # Experiment 2 (Table 3): Identical engineering task across 5-agent cohorts (RU vs EN role prompts)
    ru_cohort_b = [0.331, 0.361, 0.340, 0.358, 0.340]  # mean = 0.346, 0/5 > 0.50
    en_cohort_b = [0.542, 0.528, 0.556, 0.519, 0.425]  # mean = 0.514, 4/5 > 0.50

    b_ru, s_ru, sadj_ru = compute_s_adjusted(ru_cohort_b)
    b_en, s_en, sadj_en = compute_s_adjusted(en_cohort_b)
    uplift_pct = ((b_en - b_ru) / b_ru) * 100.0

    print("=== EraDev NNB-2026 Experiment 2: Phantom Coherence Rank Inversion ===")
    print(f"Group RU: B_bar={b_ru:.3f} | S_team={s_ru:.3f} | S_adjusted={sadj_ru:.3f} | Phantom={detect_phantom_coherence(s_ru, sadj_ru)}")
    print(f"Group EN: B_bar={b_en:.3f} | S_team={s_en:.3f} | S_adjusted={sadj_en:.3f} | Phantom={detect_phantom_coherence(s_en, sadj_en)}")
    print(f"Mean B_bar uplift (EN vs RU): +{uplift_pct:.1f}%")
    print(f"Naive S_team prefers RU ({s_ru:.3f} > {s_en:.3f}), whereas S_adjusted inverts ranking ({sadj_ru:.3f} < {sadj_en:.3f}).")


if __name__ == "__main__":
    main()
