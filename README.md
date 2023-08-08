Download all files from this github repo and organise them in seperate folders for each chain (ETH mainnet, BSC and Polygon)
Upload the files to remix IDE (https://remix.ethereum.org/)
Make sure your metamask is connected to the network you're trying to deploy it to
Select the proper compiler version and compile all smart contracts
Deploy investmentsinfo.sol separately for Launchpad, Fairlaunch and Private Sale
Pass the address of investmentsinfo.sol to the factory contract of launchpad/fairlaunch/private sale in constructor during deployment
LiqGenTokenFactory and CreateTokenFactory are single files for token generation
SSSairdropfactory.sol is the factory contract for Public Airdrop
SEairdropfactory.sol is the factory contract for Private Airdrop
SSSlockfactory.sol is the factory contract for tokenlock
