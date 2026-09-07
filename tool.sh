#!/bin/bash

ping_menu() {
    while true; do
        clear

        echo "=== Ping ==="
        echo
        echo "Enter host/IP to ping"
        echo "0) Back"
        echo

        read -p "> " target

        if [[ "$target" == "0" ]]; then
            break
        fi

        ping "$target"

        echo
        read -p "Press Enter to continue..."
    done
}

dns_lookup() {
  while true; do
      clear
      echo "=== DNS lookup ==="
      echo
      echo "Enter host/IP to nslookup"
      echo "0) Back"
      echo

      read -p "> " target
      if [[ "$target" == "0" ]]; then
        break
      fi

      nslookup "$target"
      echo
      read -p "Press Enter to continue..."
    done
}

traceroute_menu() {
  while true; do
      clear
      echo "=== Traceroute ==="
      echo
      echo "Enter host/IP to traceroute"
      echo "0) Back"
      echo

      read -p "> " target
      if [[ "$target" == "0" ]]; then
        break
      fi

      traceroute "$target"
      echo
     read -p "Press Enter to continue..."

  done
}

PS3="Select the operation: "

select opt in Ping "DNS lookup" Traceroute "Port Check" "HTTP Check" "Network Interfaces" "Network Diagnostics" Exit
do
    case $opt in
        Ping)
            ping_menu
            ;;

        "DNS lookup")
          dns_lookup
            ;;

        Traceroute)
            traceroute_menu
            ;;

        "Port Check")
            echo "Port Check"
            ;;

        "HTTP Check")
            echo "HTTP Check"
            ;;

        "Network Interfaces")
            echo "Network Interfaces"
            ;;

        "Network Diagnostics")
            echo "Network Diagnostics"
            ;;

        Exit)
            break
            ;;

        *)
            echo "Invalid option $REPLY"
            ;;
    esac
done
