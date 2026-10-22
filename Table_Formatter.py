import pandas as pd
from rich.console import Console
from rich.table import Table


def format_table(table, table_name):
    console = Console()

    # Changed title_style and header_style to 'bright_blue' for high contrast
    rich_table = Table(
        title=table_name,
        title_style="bold cyan",
        header_style="bold cyan",
        border_style="grey50",
        style="grey50",
    )

    # 1. Handle Pandas DataFrame
    if isinstance(table, pd.DataFrame):
        if table.empty:
            console.print(rich_table)
            return
        headers = [str(col) for col in table.columns]
        rows = table.values.tolist()

    # 2. Safe check for standard empty lists or dictionaries
    elif not table:
        console.print(rich_table)
        return

    # 3. Handle a single dictionary
    elif isinstance(table, dict):
        headers = list(table.keys())
        rows = list(
            zip(
                *[
                    list(v) if not isinstance(v, (str, bytes)) else [v]
                    for v in table.values()
                ]
            )
        )

    # 4. Handle a list of dictionaries
    elif isinstance(table, list) and len(table) > 0 and isinstance(table[0], dict):
        headers = list(table[0].keys())
        rows = [[row.get(h, "") for h in headers] for row in table]

    # 5. Handle standard matrix arrays
    else:
        headers = (
            [str(i) for i in range(len(table[0]))] if (table and len(table) > 0) else []
        )
        rows = table

    # Build columns with the brighter styling
    for header in headers:
        rich_table.add_column(
            str(header),
            overflow="fold",
            style="grey50",
            header_style="bold cyan",  # Updated color here too
        )

    # Add data cells
    for row in rows:
        rich_table.add_row(*[str(cell) for cell in row])

    console.print(rich_table)
