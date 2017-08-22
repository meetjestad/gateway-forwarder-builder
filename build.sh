#!/bin/bash
make -C packet_forwarder clean
make -C lora_gateway clean
make -C lora_gateway CFG_SPI=native PLATFORM=lorank
make -C packet_forwarder/lora_pkt_fwd


VERSION=$(cd packet_forwarder; git describe --tags)
DIR=forwarder
TARBALL=forwarder-${VERSION}.tgz

rm -rf "${DIR}"
rm -f "${TARBALL}"

mkdir -p "${DIR}"
cp packet_forwarder/lora_pkt_fwd/lora_pkt_fwd "${DIR}"
cp packet_forwarder/lora_pkt_fwd/global_conf.json "${DIR}"
cp start "${DIR}"
# Record the version inside the tarball
touch "${DIR}"/"${VERSION}"
tar -czf "${TARBALL}" "${DIR}"
