package main

import (
	"github.com/skynetservices/skydns1/msg"
	"github.com/artemkaint/go-powerdns-client/response"
)

// Interface to allow mocking of the
// skydns client
type PowerDNS interface {
	// GET /servers
	GetServers() (*[]response.ServerResource, error)
	// GET /servers/:server_id
	GetServer(uuid string) (*response.ServerResource, error)
	// GET /servers/:server_id/config
	GetServerConfigs() error
	// GET /servers/:server_id/config/:config_setting_name
	GetServerConfig(uuid string) error
	// GET /servers/:server_id/zones
	GetZones() (*[]response.ZoneCollection, error)
	// POST /servers/:server_id/zones
	AddZone(zone string, server interface{}) (*response.ZoneCollection, error)

	Add(uuid string, service *msg.Service) error
	Delete(uuid string) error
	Update(uuid string, ttl uint32) error
}
