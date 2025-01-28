from gps import gps

problem = {
    'initial': ['space on a', 'a on table', 'space on b', 'b on table2', 'space on c', 'c on table3', 'space on table'],
    'goal': ['space on a', 'a on b', 'b on c', 'c on table', 'space on table2', 'space on table3' ],
    
    'actions': [
        # First action: Move c from table3 to table
        {
            'action': 'move c from table3 to table',
            'preconds': [
                'space on c',
                'space on table',
                'c on table3'
            ],
            'add': [
                'c on table',
                'space on table3'
            ],
            'delete': [
                'c on table3',
                'space on table'
            ]
        },
        # Second action: Move b from table2 to c after c is on table
        {
            'action': 'move b from table2 to c',
            'preconds': [
                'space on b',
                'space on c',
                'b on table2',
                'c on table'
            ],
            'add': [
                'b on c',
                'space on table2'
            ],
            'delete': [
                'b on table2',
                'space on c'
            ]
        },
        # Final action: Move a from table to b after b is on c
        {
            'action': 'move a from table to b',
            'preconds': [
                'space on a',
                'space on b',
                'a on table',
                'b on c'
            ],
            'add': [
                'a on b',
                'space on table'
            ],
            'delete': [
                'a on table',
                'space on b'
            ]
        },
        
        {
            'action': 'move c from table to table',
            'preconds': [
                'space on c',
                'space on table',
                'c on table'
            ],
            'add': [
                'c on table',
                'space on table'
            ],
            'delete': [
                'c on table',
                'space on table'
            ]
        }
    ]
}

if __name__ == '__main__':
    # Use GPS to solve the problem
    action_sequence = gps(
        problem['initial'],
        problem['goal'],
        problem['actions']
    )

    # Print the solution
    if action_sequence is not None:
        for action in action_sequence:
            print(action)
    else:
        print('\nPlan failure...')