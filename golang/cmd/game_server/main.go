package main

import (
	"golang/lib/core"
	"golang/lib/database"
	"golang/lib/game_server/configuration"
	"golang/lib/game_server/server"
)

func main() {
	core.Initialize("Game server starting...")
	serverSettings := core.Configuration{
		Port:             "7072",
		ConnectionString: "",
	}
	configuration := configuration.Configuration{
		ServerSettings: &serverSettings,
	}

	database := database.New(serverSettings.ConnectionString)

	var server = server.New(&configuration, database)
	server.Start()
}
