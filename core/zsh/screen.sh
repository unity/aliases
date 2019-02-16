# aliases
alias sr='screen -dmS'
alias sa='screen -r'

# functions
sk() {
    screen -S $1 -X quit
}