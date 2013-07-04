## Usage

Here are some general instructions for getting the most out of Proviso.

### Connecting to MySQL from host

Connecting to the MySQL database via your favourite GUI tool is as
simple as it has always been while developing locally. We use port
`3309` to avoid port conflicts with any MySQL servers running on the
host machine.

Here is an example configuration using *Sequel Pro*'s "Standard"
connection type (no need for the "SSH" connection type):

Name: `Proviso`
Host: `127.0.0.1`
Username: `root`
Password: `root`
Database: *blank*
Port: `3309`
