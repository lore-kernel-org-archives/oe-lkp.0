Content-Type: multipart/mixed; boundary="===============6278594531213533379=="
MIME-Version: 1.0
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: lkp@lists.01.org
Subject: Re: [nf_flowtable] 2cd764935d: kernel-selftests.netfilter.nft_flowtable.sh.ipsec_tunnel_mode_for_ns1/ns2.fail
Date: Tue, 10 May 2022 11:58:45 +0200
Message-ID: <Yno3VXOUEzAOSdDe@salvia>
In-Reply-To: <20220510092803.GA3969@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6278594531213533379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 10, 2022 at 05:28:03PM +0800, kernel test robot wrote:
[...] =

> # selftests: netfilter: nft_flowtable.sh
> # PASS: netns routing/connectivity: ns1 can reach ns2
> # FAIL: file mismatch for ns1 -> ns2
> # -rw------- 1 root root 227328 May  8 22:05 /tmp/tmp.fnnwOCWcA4
> # -rw------- 1 root root 99388 May  8 22:05 /tmp/tmp.LL8ohakyGQ
> # FAIL: file mismatch for ns1 <- ns2
> # -rw------- 1 root root 296960 May  8 22:05 /tmp/tmp.1DlwdJLSUX
> # -rw------- 1 root root 15584 May  8 22:05 /tmp/tmp.HnObAriWng
> # FAIL: flow offload for ns1/ns2:
> # table inet filter {
> # 	flowtable f1 {
> # 		hook ingress priority 0
> # 		devices =3D { veth0, veth1 }
> # 	}
> # =

> # 	chain forward {
> # 		type filter hook forward priority 0; policy drop;
> # 		oif "veth1" tcp dport 12345 flow offload @f1 counter packets 0 bytes 0
> # 		tcp dport 12345 meta length > 200 ct mark set 0x00000001 counter pack=
ets 14 bytes 103660
> # 		tcp flags fin,rst ct mark set 0x00000000 accept
> # 		meta length > 1500 accept comment "something-to-grep-for"
> # 		tcp sport 12345 ct mark 0x00000001 counter packets 57 bytes 8220 log =
prefix "mark failure " drop
> # 		ct state established,related accept
> # 		meta length < 200 oif "veth1" tcp dport 12345 counter packets 1 bytes=
 60 accept
> # 		meta l4proto icmp accept
> # 		meta l4proto ipv6-icmp accept
> # 	}
> # }
> # /dev/stdin:4:73-74: Error: syntax error, unexpected to, expecting newli=
ne or semicolon
> #       meta iif "veth0" ip daddr 10.6.6.6 tcp dport 1666 counter dnat ip=
 to 10.0.2.99:12345
> #                                                                        =
 ^^

What nftables userspace version is kbuild robot using?

It seems this rule fails to load, looks like a unrelated issue?
--===============6278594531213533379==--

