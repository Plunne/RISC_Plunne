# MUX_PCSEL UNIT TESTS

MUX Program Counter Selector unit tests

> *Note : Abbrevations descriptions can be found into the Lexical Register.*

-----

## MUX_PCSEL_TU001 - PCSEL HOLD MODE

Verify that when all controls signals are not asserted, the MUX returns the hold pointer value.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `IN_PROGRESS` | 2026/02/01 | Plunne      | Plunne        |

Linked to: MUX_PCSEL_R001

| Step | Procedure                                              | Expectations                                    |
|-----:|:-------------------------------------------------------|:------------------------------------------------|
|    1 | Ensure `RST`, `SP_EN` and `INCR` inputs are equal to 0 | `RST`, `SP_EN` and `INCR` inputs are equal to 0 |
|    2 | Maintain inputs stable for a short period              | MUX output remains equal to `000`               |

## MUX_PCSEL_TU002 - PCSEL RESET MODE

Verify that when all controls signals are asserted, the MUX returns the reset pointer value.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `IN_PROGRESS` | 2026/02/01 | Plunne      | Plunne        |

Linked to: MUX_PCSEL_R002

| Step | Procedure                                              | Expectations                                                              |
|-----:|:-------------------------------------------------------|:--------------------------------------------------------------------------|
|    1 | Ensure `RST`, `SP_EN` and `INCR` inputs are equal to 0 | `RST`, `SP_EN` and `INCR` inputs are equal to 0                           |
|    2 | Set `RST`, `SP_EN` and `INCR` high for a stable period | `RST`, `SP_EN` and `INCR` inputs are equal to 1; MUX output returns `100` |
|    3 | Set `RST`, `SP_EN` and `INCR` low for a stable period  | `RST`, `SP_EN` and `INCR` inputs are equal to 0; MUX output returns `000` |

## MUX_PCSEL_TU003 - PCSEL SET MODE

Verify that when both `SP_EN` and `INCR` signals are asserted, the MUX returns the set pointer value.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `IN_PROGRESS` | 2026/02/01 | Plunne      | Plunne        |

Linked to: MUX_PCSEL_R003

| Step | Procedure                                              | Expectations                                                       |
|-----:|:-------------------------------------------------------|:-------------------------------------------------------------------|
|    1 | Ensure `RST`, `SP_EN` and `INCR` inputs are equal to 0 | `RST`, `SP_EN` and `INCR` inputs are equal to 0                    |
|    2 | Set `SP_EN` and `INCR` high for a stable period        | `SP_EN` and `INCR` inputs are equal to 1; MUX output returns `010` |
|    3 | Set `SP_EN` and `INCR` low for a stable period         | `SP_EN` and `INCR` inputs are equal to 0; MUX output returns `000` |

## MUX_PCSEL_TU004 - PCSEL INCREMENT MODE

Verify that when only `INCR` signal is asserted, the MUX returns the increment pointer value.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/02/01  | 2026/02/01  | `IN_PROGRESS` | 2026/02/01 | Plunne      | Plunne        |

Linked to: MUX_PCSEL_R004

| Step | Procedure                                              | Expectations                                    |
|-----:|:-------------------------------------------------------|:------------------------------------------------|
|    1 | Ensure `RST`, `SP_EN` and `INCR` inputs are equal to 0 | `RST`, `SP_EN` and `INCR` inputs are equal to 0 |
|    2 | Set `INCR` high for a stable period                    | `INCR` = 1; MUX output returns `001`            |
|    3 | Set `INCR` low for a stable period                     | `INCR` = 0; MUX output returns `000`            |
