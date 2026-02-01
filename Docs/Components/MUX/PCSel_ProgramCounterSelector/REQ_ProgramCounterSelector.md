# MUX_PCSEL REQUIEREMENTS

MUX Program Counter Selector requierements

> *Note : Abbrevations descriptions can be found into the Lexical Register.*

-----

## MUX_PCSEL_R001 - HOLD CONDITION

PC Selector shall return hold value if all control signals are not set.

| Creator | Created Date | Edited Date |   Status   | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `APPROVED` |  2026/02/01   | Plunne      | Plunne        |

Tested by : MUX_PCSEL_TU001

## MUX_PCSEL_R002 - RESET CONDITION

PC Selector shall return reset value if the reset control signal is set.

| Creator | Created Date | Edited Date |   Status   | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `APPROVED` |  2026/02/01   | Plunne      | Plunne        |

Tested by : MUX_PCSEL_TU002

## MUX_PCSEL_R003 - SET CONDITION

PC Selector shall return set pointer value if set control signal is set but not the reset one.

| Creator | Created Date | Edited Date |   Status   | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `APPROVED` |  2026/02/01   | Plunne      | Plunne        |

Tested by : MUX_PCSEL_TU003

## MUX_PCSEL_R004 - INCREMENT CONDITION

PC Selector shall return increment value if all control signals are not set except the increment signal.

| Creator | Created Date | Edited Date |   Status   | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `APPROVED` |  2026/02/01   | Plunne      | Plunne        |

Tested by : MUX_PCSEL_TU004
