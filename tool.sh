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

portcheck_menu() {
  while true; do
      clear
      echo "=== Port Check ==="
      echo
      echo "Enter host"
      echo "0) Back"
      echo

      read -p "> " target
      if [[ "$target" == "0" ]]; then
        break
      fi

      read -p  "Enter port: " port

             if nc -z -w 3 "$target" "$port" 2>/dev/null; then
            echo "Port $port is OPEN"
        else
            echo "Port $port is CLOSED or unreachable"
        fi


     read -p "Press Enter to continue..."

  done
}


httpcheck_menu() {
  while true; do
      clear
      echo "=== HTTP check ==="
      echo
      echo "Enter URL to HTTP check"
      echo "0) Back"
      echo


      read -p "> " url
      if [[ "$url" == "0" ]]; then
        break
      fi

      curl -s -o /dev/null \
       -w "Status: %{http_code}\nTime: %{time_total}s\n" \
       "$url"

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
            portcheck_menu
            ;;

        "HTTP Check")
            httpcheck_menu
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
