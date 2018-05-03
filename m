Content-Type: multipart/mixed; boundary="===============3659209874511249718=="
MIME-Version: 1.0
From: kernel test robot <shun.hao@intel.com>
To: lkp@lists.01.org
Subject: [lkp-robot] 486ad79630 [ 15.532543] BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
Date: Thu, 03 May 2018 12:14:50 +0800
Message-ID: <20180503041450.pq2njvkssxtay64o@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3659209874511249718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Greetings,

0day kernel testing robot got the below dmesg and the first bad commit is

git://git.cmpxchg.org/linux-mmotm.git master

commit 486ad79630d0ba0b7205a8db9fe15ba392f5ee32
Author:     Andrew Morton <akpm@linux-foundation.org>
AuthorDate: Fri Apr 20 22:00:53 2018 +0000
Commit:     Johannes Weiner <hannes@cmpxchg.org>
CommitDate: Fri Apr 20 22:00:53 2018 +0000

    origin
    =

    GIT a9e5b73288cf1595ac2e05cf1acd1924ceea05fa
    =

    commit a9e5b73288cf1595ac2e05cf1acd1924ceea05fa
    Author: David Howells <dhowells@redhat.com>
    Date:   Fri Apr 20 13:35:02 2018 +0100
    =

        vfs: Undo an overly zealous MS_RDONLY -> SB_RDONLY conversion
    =

        In do_mount() when the MS_* flags are being converted to MNT_* flag=
s,
        MS_RDONLY got accidentally convered to SB_RDONLY.
    =

        Undo this change.
    =

        Fixes: e462ec50cb5f ("VFS: Differentiate mount flags (MS_*) from in=
ternal superblock flags")
        Signed-off-by: David Howells <dhowells@redhat.com>
        Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
    =

    commit 660625922b3d9fcb376e5870299bc5c1086e1d32
    Author: David Howells <dhowells@redhat.com>
    Date:   Wed Apr 18 09:38:34 2018 +0100
    =

        afs: Fix server record deletion
    =

        AFS server records get removed from the net->fs_servers tree when
        they're deleted, but not from the net->fs_addresses{4,6} lists, whi=
ch
        can lead to an oops in afs_find_server() when a server record has b=
een
        removed, for instance during rmmod.
    =

        Fix this by deleting the record from the by-address lists before po=
sting
        it for RCU destruction.
    =

        The reason this hasn't been noticed before is that the fileserver k=
eeps
        probing the local cache manager, thereby keeping the service record
        alive, so the oops would only happen when a fileserver eventually g=
ets
        bored and stops pinging or if the module gets rmmod'd and a call co=
mes
        in from the fileserver during the window between the server records
        being destroyed and the socket being closed.
    =

        The oops looks something like:
    =

          BUG: unable to handle kernel NULL pointer dereference at 00000000=
0000001c
          ...
          Workqueue: kafsd afs_process_async_call [kafs]
          RIP: 0010:afs_find_server+0x271/0x36f [kafs]
          ...
          Call Trace:
           afs_deliver_cb_init_call_back_state3+0x1f2/0x21f [kafs]
           afs_deliver_to_call+0x1ee/0x5e8 [kafs]
           afs_process_async_call+0x5b/0xd0 [kafs]
           process_one_work+0x2c2/0x504
           worker_thread+0x1d4/0x2ac
           kthread+0x11f/0x127
           ret_from_fork+0x24/0x30
    =

        Fixes: d2ddc776a458 ("afs: Overhaul volume and server record cachin=
g and fileserver rotation")
        Signed-off-by: David Howells <dhowells@redhat.com>
        Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
    =

    commit 16a34adb9392b2fe4195267475ab5b472e55292c
    Author: Al Viro <viro@zeniv.linux.org.uk>
    Date:   Thu Apr 19 22:03:08 2018 -0400
    =

        Don't leak MNT_INTERNAL away from internal mounts
    =

        We want it only for the stuff created by SB_KERNMOUNT mounts, *not*=
 for
        their copies.  As it is, creating a deep stack of bindings of /proc=
/*/ns/*
        somewhere in a new namespace and exiting yields a stack overflow.
    =

        Cc: stable(a)kernel.org
        Reported-by: Alexander Aring <aring@mojatatu.com>
        Bisected-by: Kirill Tkhai <ktkhai@virtuozzo.com>
        Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
        Tested-by: Alexander Aring <aring@mojatatu.com>
        Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
    =

    commit 1255fcb2a655f05e02f3a74675a6d6525f187afd
    Author: Ursula Braun <ubraun@linux.vnet.ibm.com>
    Date:   Thu Apr 19 15:56:40 2018 +0200
    =

        net/smc: fix shutdown in state SMC_LISTEN
    =

        Calling shutdown with SHUT_RD and SHUT_RDWR for a listening SMC soc=
ket
        crashes, because
           commit 127f49705823 ("net/smc: release clcsock from tcp_listen_w=
orker")
        releases the internal clcsock in smc_close_active() and sets smc->c=
lcsock
        to NULL.
        For SHUT_RD the smc_close_active() call is removed.
        For SHUT_RDWR the kernel_sock_shutdown() call is omitted, since the
        clcsock is already released.
    =

        Fixes: 127f49705823 ("net/smc: release clcsock from tcp_listen_work=
er")
        Signed-off-by: Ursula Braun <ubraun@linux.vnet.ibm.com>
        Reported-by: Stephen Hemminger <stephen@networkplumber.org>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit a60faa60da891e311e19fd3e88d611863f431130
    Author: Vasundhara Volam <vasundhara-v.volam@broadcom.com>
    Date:   Thu Apr 19 03:16:16 2018 -0400
    =

        bnxt_en: Fix memory fault in bnxt_ethtool_init()
    =

        In some firmware images, the length of BNX_DIR_TYPE_PKG_LOG nvram t=
ype
        could be greater than the fixed buffer length of 4096 bytes allocat=
ed by
        the driver.  This was causing HWRM_NVM_READ to copy more data to th=
e buffer
        than the allocated size, causing general protection fault.
    =

        Fix the issue by allocating the exact buffer length returned by
        HWRM_NVM_FIND_DIR_ENTRY, instead of 4096.  Move the kzalloc() call
        into the bnxt_get_pkgver() function.
    =

        Fixes: 3ebf6f0a09a2 ("bnxt_en: Add installed-package firmware versi=
on reporting via Ethtool GDRVINFO")
        Signed-off-by: Vasundhara Volam <vasundhara-v.volam@broadcom.com>
        Signed-off-by: Michael Chan <michael.chan@broadcom.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit f4ee703ace847f299da00944d57db7ff91786d0b
    Author: Michael S. Tsirkin <mst@redhat.com>
    Date:   Thu Apr 19 08:30:50 2018 +0300
    =

        virtio_net: sparse annotation fix
    =

        offloads is a buffer in virtio format, should use
        the __virtio64 tag.
    =

        Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
        Acked-by: Jason Wang <jasowang@redhat.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit d7fad4c840f33a6bd333dd7fbb3006edbcf0017a
    Author: Michael S. Tsirkin <mst@redhat.com>
    Date:   Thu Apr 19 08:30:49 2018 +0300
    =

        virtio_net: fix adding vids on big-endian
    =

        Programming vids (adding or removing them) still passes
        guest-endian values in the DMA buffer. That's wrong
        if guest is big-endian and when virtio 1 is enabled.
    =

        Note: this is on top of a previous patch:
                virtio_net: split out ctrl buffer
    =

        Fixes: 9465a7a6f ("virtio_net: enable v1.0 support")
        Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
        Acked-by: Jason Wang <jasowang@redhat.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 12e571693837d6164bda61e316b1944972ee0d97
    Author: Michael S. Tsirkin <mst@redhat.com>
    Date:   Thu Apr 19 08:30:48 2018 +0300
    =

        virtio_net: split out ctrl buffer
    =

        When sending control commands, virtio net sets up several buffers f=
or
        DMA. The buffers are all part of the net device which means it's
        actually allocated by kvmalloc so it's in theory (on extreme memory
        pressure) possible to get a vmalloc'ed buffer which on some platfor=
ms
        means we can't DMA there.
    =

        Fix up by moving the DMA buffers into a separate structure.
    =

        Reported-by: Mikulas Patocka <mpatocka@redhat.com>
        Suggested-by: Eric Dumazet <eric.dumazet@gmail.com>
        Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
        Acked-by: Jason Wang <jasowang@redhat.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit f4ea89110df237da6fbcaab76af431e85f07d904
    Author: dann frazier <dann.frazier@canonical.com>
    Date:   Wed Apr 18 21:55:41 2018 -0600
    =

        net: hns: Avoid action name truncation
    =

        When longer interface names are used, the action names exposed in
        /proc/interrupts and /proc/irq/* maybe truncated. For example, when
        using the predictable name algorithm in systemd on a HiSilicon D05,
        I see:
    =

          ubuntu(a)d05-3:~$  grep enahisic2i0-tx /proc/interrupts | sed 's/=
.* //'
          enahisic2i0-tx0
          enahisic2i0-tx1
          [...]
          enahisic2i0-tx8
          enahisic2i0-tx9
          enahisic2i0-tx1
          enahisic2i0-tx1
          enahisic2i0-tx1
          enahisic2i0-tx1
          enahisic2i0-tx1
          enahisic2i0-tx1
    =

        Increase the max ring name length to allow for an interface name
        of IFNAMSIZE. After this change, I now see:
    =

          $ grep enahisic2i0-tx /proc/interrupts | sed 's/.* //'
          enahisic2i0-tx0
          enahisic2i0-tx1
          enahisic2i0-tx2
          [...]
          enahisic2i0-tx8
          enahisic2i0-tx9
          enahisic2i0-tx10
          enahisic2i0-tx11
          enahisic2i0-tx12
          enahisic2i0-tx13
          enahisic2i0-tx14
          enahisic2i0-tx15
    =

        Signed-off-by: dann frazier <dann.frazier@canonical.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit ab913455dd59b81204b6a0d387a44697b0e0bd85
    Author: Olivier Gayot <olivier.gayot@sigexec.com>
    Date:   Wed Apr 18 22:03:06 2018 +0200
    =

        docs: ip-sysctl.txt: fix name of some ipv6 variables
    =

        The name of the following proc/sysctl entries were incorrectly
        documented:
    =

            /proc/sys/net/ipv6/conf/<interface>/max_dst_opts_number
            /proc/sys/net/ipv6/conf/<interface>/max_hbt_opts_number
            /proc/sys/net/ipv6/conf/<interface>/max_dst_opts_length
            /proc/sys/net/ipv6/conf/<interface>/max_hbt_length
    =

        Their name was set to the name of the symbol in the .data field of =
the
        control table instead of their .proc name.
    =

        Signed-off-by: Olivier Gayot <olivier.gayot@sigexec.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 65ec0bd1c7c14522670a5294de35710fb577a7fd
    Author: Ronak Doshi <doshir@vmware.com>
    Date:   Wed Apr 18 12:48:04 2018 -0700
    =

        vmxnet3: fix incorrect dereference when rxvlan is disabled
    =

        vmxnet3_get_hdr_len() is used to calculate the header length which =
in
        turn is used to calculate the gso_size for skb. When rxvlan offload=
 is
        disabled, vlan tag is present in the header and the function refere=
nces
        ip header from sizeof(ethhdr) and leads to incorrect pointer refere=
nce.
    =

        This patch fixes this issue by taking sizeof(vlan_ethhdr) into acco=
unt
        if vlan tag is present and correctly references the ip hdr.
    =

        Signed-off-by: Ronak Doshi <doshir@vmware.com>
        Acked-by: Guolin Yang <gyang@vmware.com>
        Acked-by: Louis Luo <llouis@vmware.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit f7e43672683b097bb074a8fe7af9bc600a23f231
    Author: Cong Wang <xiyou.wangcong@gmail.com>
    Date:   Wed Apr 18 11:51:56 2018 -0700
    =

        llc: hold llc_sap before release_sock()
    =

        syzbot reported we still access llc->sap in llc_backlog_rcv()
        after it is freed in llc_sap_remove_socket():
    =

        Call Trace:
         __dump_stack lib/dump_stack.c:77 [inline]
         dump_stack+0x1b9/0x294 lib/dump_stack.c:113
         print_address_description+0x6c/0x20b mm/kasan/report.c:256
         kasan_report_error mm/kasan/report.c:354 [inline]
         kasan_report.cold.7+0x242/0x2fe mm/kasan/report.c:412
         __asan_report_load1_noabort+0x14/0x20 mm/kasan/report.c:430
         llc_conn_ac_send_sabme_cmd_p_set_x+0x3a8/0x460 net/llc/llc_c_ac.c:=
785
         llc_exec_conn_trans_actions net/llc/llc_conn.c:475 [inline]
         llc_conn_service net/llc/llc_conn.c:400 [inline]
         llc_conn_state_process+0x4e1/0x13a0 net/llc/llc_conn.c:75
         llc_backlog_rcv+0x195/0x1e0 net/llc/llc_conn.c:891
         sk_backlog_rcv include/net/sock.h:909 [inline]
         __release_sock+0x12f/0x3a0 net/core/sock.c:2335
         release_sock+0xa4/0x2b0 net/core/sock.c:2850
         llc_ui_release+0xc8/0x220 net/llc/af_llc.c:204
    =

        llc->sap is refcount'ed and llc_sap_remove_socket() is paired
        with llc_sap_add_socket(). This can be amended by holding its refco=
unt
        before llc_sap_remove_socket() and releasing it after release_sock(=
).
    =

        Reported-by: <syzbot+6e181fc95081c2cf9051@syzkaller.appspotmail.c=
om>
        Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 02b94fc70ffe320a7799c35e09372809e40b7131
    Author: Jonathan Corbet <corbet@lwn.net>
    Date:   Wed Apr 18 10:14:13 2018 -0600
    =

        MAINTAINERS: Direct networking documentation changes to netdev
    =

        Networking docs changes go through the networking tree, so patch the
        MAINTAINERS file to direct authors to the right place.
    =

        Signed-off-by: Jonathan Corbet <corbet@lwn.net>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit f3335545b34315fc42cc03a83165bdd26d956584
    Author: Colin Ian King <colin.king@canonical.com>
    Date:   Wed Apr 18 16:55:05 2018 +0100
    =

        atm: iphase: fix spelling mistake: "Tansmit" -> "Transmit"
    =

        Trivial fix to spelling mistake in message text.
    =

        Signed-off-by: Colin Ian King <colin.king@canonical.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 4ec7eb3ff6eb5c9af3a84288a8d808a857fbc22b
    Author: Pawel Dembicki <paweldembicki@gmail.com>
    Date:   Wed Apr 18 16:03:24 2018 +0200
    =

        net: qmi_wwan: add Wistron Neweb D19Q1
    =

        This modem is embedded on dlink dwr-960 router.
        The oem configuration states:
    =

        T: Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D 2 Spd=3D4=
80 MxCh=3D 0
        D: Ver=3D 2.10 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=
=3D 1
        P: Vendor=3D1435 ProdID=3Dd191 Rev=3Dff.ff
        S: Manufacturer=3DAndroid
        S: Product=3DAndroid
        S: SerialNumber=3D0123456789ABCDEF
        C:* #Ifs=3D 6 Cfg#=3D 1 Atr=3D80 MxPwr=3D500mA
        I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff =
Driver=3D(none)
        E: Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        E: Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D42 Prot=3D01 =
Driver=3D(none)
        E: Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        E: Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        I:* If#=3D 2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 =
Driver=3D(none)
        E: Ad=3D84(I) Atr=3D03(Int.) MxPS=3D 10 Ivl=3D32ms
        E: Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        E: Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        I:* If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 =
Driver=3D(none)
        E: Ad=3D86(I) Atr=3D03(Int.) MxPS=3D 10 Ivl=3D32ms
        E: Ad=3D85(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        E: Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        I:* If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff =
Driver=3Dqmi_wwan
        E: Ad=3D88(I) Atr=3D03(Int.) MxPS=3D 8 Ivl=3D32ms
        E: Ad=3D87(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        E: Ad=3D05(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        I:* If#=3D 5 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 =
Driver=3D(none)
        E: Ad=3D89(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
        E: Ad=3D06(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D125us
    =

        Tested on openwrt distribution
    =

        Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
        Acked-by: Bj=C3=B8rn Mork <bjorn@mork.no>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 5e84b38b07e676fcd3ab6e296780b4f77a29d09f
    Author: Colin Ian King <colin.king@canonical.com>
    Date:   Wed Apr 18 12:00:08 2018 +0100
    =

        net: caif: fix spelling mistake "UKNOWN" -> "UNKNOWN"
    =

        Trivial fix to spelling mistake
    =

        Signed-off-by: Colin Ian King <colin.king@canonical.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 565020aaeebfa7c8b3ec077bee38f4c15acc9905
    Author: Jose Abreu <Jose.Abreu@synopsys.com>
    Date:   Wed Apr 18 10:57:55 2018 +0100
    =

        net: stmmac: Disable ACS Feature for GMAC >=3D 4
    =

        ACS Feature is currently enabled for GMAC >=3D 4 but the llc_snap s=
tatus
        is never checked in descriptor rx_status callback. This will cause
        stmmac to always strip packets even that ACS feature is already
        stripping them.
    =

        Lets be safe and disable the ACS feature for GMAC >=3D 4 and always=
 strip
        the packets for this GMAC version.
    =

        Fixes: 477286b53f55 ("stmmac: add GMAC4 core support")
        Signed-off-by: Jose Abreu <joabreu@synopsys.com>
        Cc: David S. Miller <davem@davemloft.net>
        Cc: Joao Pinto <jpinto@synopsys.com>
        Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
        Cc: Alexandre Torgue <alexandre.torgue@st.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit da42bb271305d68df6cbf99eed90542f1f1ee1c9
    Author: Maxime Chevallier <maxime.chevallier@bootlin.com>
    Date:   Wed Apr 18 11:14:44 2018 +0200
    =

        net: mvpp2: Fix DMA address mask size
    =

        PPv2 TX/RX descriptors uses 40bits DMA addresses, but 41 bits masks=
 were
        used (GENMASK_ULL(40, 0)).
    =

        This commit fixes that by using the correct mask.
    =

        Fixes: e7c5359f2eed ("net: mvpp2: introduce PPv2.2 HW descriptors a=
nd adapt accessors")
        Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit bb9aaaa1849eed763c6b7f20227a8a03300d4421
    Author: sunlianwen <sunlw.fnst@cn.fujitsu.com>
    Date:   Wed Apr 18 09:22:39 2018 +0800
    =

        net: change the comment of dev_mc_init
    =

        The comment of dev_mc_init() is wrong. which use dev_mc_flush
        instead of dev_mc_init.
    =

        Signed-off-by: Lianwen Sun <sunlw.fnst(a)cn.fujitsu.com
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit b658912cb023cd6f8e46963d29779903d3c10538
    Author: Jiri Kosina <jkosina@suse.cz>
    Date:   Thu Apr 19 09:25:15 2018 +0200
    =

        HID: i2c-hid: fix inverted return value from i2c_hid_command()
    =

        i2c_hid_command() returns non-zero in error cases (the actual
        errno). Error handling in for I2C_HID_QUIRK_RESEND_REPORT_DESCR
        case in i2c_hid_resume() had the check inverted; fix that.
    =

        Fixes: 3e83eda467 ("HID: i2c-hid: Fix resume issue on Raydium touch=
screen device")
        Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
        Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    =

    commit 56376c5864f8ff4ba7c78a80ae857eee3b1d23d8
    Author: Michael Ellerman <mpe@ellerman.id.au>
    Date:   Thu Apr 19 16:22:20 2018 +1000
    =

        powerpc/kvm: Fix lockups when running KVM guests on Power8
    =

        When running KVM guests on Power8 we can see a lockup where one CPU
        stops responding. This often leads to a message such as:
    =

          watchdog: CPU 136 detected hard LOCKUP on other CPUs 72
          Task dump for CPU 72:
          qemu-system-ppc R  running task    10560 20917  20908 0x00040004
    =

        And then backtraces on other CPUs, such as:
    =

          Task dump for CPU 48:
          ksmd            R  running task    10032  1519      2 0x00000804
          Call Trace:
            ...
            --- interrupt: 901 at smp_call_function_many+0x3c8/0x460
                LR =3D smp_call_function_many+0x37c/0x460
            pmdp_invalidate+0x100/0x1b0
            __split_huge_pmd+0x52c/0xdb0
            try_to_unmap_one+0x764/0x8b0
            rmap_walk_anon+0x15c/0x370
            try_to_unmap+0xb4/0x170
            split_huge_page_to_list+0x148/0xa30
            try_to_merge_one_page+0xc8/0x990
            try_to_merge_with_ksm_page+0x74/0xf0
            ksm_scan_thread+0x10ec/0x1ac0
            kthread+0x160/0x1a0
            ret_from_kernel_thread+0x5c/0x78
    =

        This is caused by commit 8c1c7fb0b5ec ("powerpc/64s/idle: avoid sync
        for KVM state when waking from idle"), which added a check in
        pnv_powersave_wakeup() to see if the kvm_hstate.hwthread_state is
        already set to KVM_HWTHREAD_IN_KERNEL, and if so to skip the store =
and
        test of kvm_hstate.hwthread_req.
    =

        The problem is that the primary does not set KVM_HWTHREAD_IN_KVM wh=
en
        entering the guest, so it can then come out to cede with
        KVM_HWTHREAD_IN_KERNEL set. It can then go idle in kvm_do_nap after
        setting hwthread_req to 1, but because hwthread_state is still
        KVM_HWTHREAD_IN_KERNEL we will skip the test of hwthread_req when we
        wake up from idle and won't go to kvm_start_guest. From there the
        thread will return somewhere garbage and crash.
    =

        Fix it by skipping the store of hwthread_state, but not the test of
        hwthread_req, when coming out of idle. It's OK to skip the sync in
        that case because hwthread_req will have been set on the same threa=
d,
        so there is no synchronisation required.
    =

        Fixes: 8c1c7fb0b5ec ("powerpc/64s/idle: avoid sync for KVM state wh=
en waking from idle")
        Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    =

    commit 13a83eac373c49c0a081cbcd137e79210fe78acd
    Author: Michael Neuling <mikey@neuling.org>
    Date:   Wed Apr 11 13:37:58 2018 +1000
    =

        powerpc/eeh: Fix enabling bridge MMIO windows
    =

        On boot we save the configuration space of PCIe bridges. We do this=
 so
        when we get an EEH event and everything gets reset that we can rest=
ore
        them.
    =

        Unfortunately we save this state before we've enabled the MMIO space
        on the bridges. Hence if we have to reset the bridge when we come b=
ack
        MMIO is not enabled and we end up taking an PE freeze when the driv=
er
        starts accessing again.
    =

        This patch forces the memory/MMIO and bus mastering on when restori=
ng
        bridges on EEH. Ideally we'd do this correctly by saving the
        configuration space writes later, but that will have to come later =
in
        a larger EEH rewrite. For now we have this simple fix.
    =

        The original bug can be triggered on a boston machine by doing:
          echo 0x8000000000000000 > /sys/kernel/debug/powerpc/PCI0001/err_i=
njct_outbound
        On boston, this PHB has a PCIe switch on it.  Without this patch,
        you'll see two EEH events, 1 expected and 1 the failure we are fixi=
ng
        here. The second EEH event causes the anything under the PHB to
        disappear (i.e. the i40e eth).
    =

        With this patch, only 1 EEH event occurs and devices properly recov=
er.
    =

        Fixes: 652defed4875 ("powerpc/eeh: Check PCIe link after reset")
        Cc: stable(a)vger.kernel.org # v3.11+
        Reported-by: Pridhiviraj Paidipeddi <ppaidipe@linux.vnet.ibm.com>
        Signed-off-by: Michael Neuling <mikey@neuling.org>
        Acked-by: Russell Currey <ruscur@russell.cc>
        Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    =

    commit 64e86fec54069266ba32be551d7b7f75e88ab60c
    Author: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
    Date:   Tue Apr 17 17:40:00 2018 -0600
    =

        net: qualcomm: rmnet: Fix warning seen with fill_info
    =

        When the last rmnet device attached to a real device is removed, the
        real device is unregistered from rmnet. As a result, the real device
        lookup fails resulting in a warning when the fill_info handler is
        called as part of the rmnet device unregistration.
    =

        Fix this by returning the rmnet flags as 0 when no real device is
        present.
    =

        WARNING: CPU: 0 PID: 1779 at net/core/rtnetlink.c:3254
        rtmsg_ifinfo_build_skb+0xca/0x10d
        Modules linked in:
        CPU: 0 PID: 1779 Comm: ip Not tainted 4.16.0-11872-g7ce2367 #1
        Stack:
         7fe655f0 60371ea3 00000000 00000000
         60282bc6 6006b116 7fe65600 60371ee8
         7fe65660 6003a68c 00000000 900000000
        Call Trace:
         [<6006b116>] ? printk+0x0/0x94
         [<6001f375>] show_stack+0xfe/0x158
         [<60371ea3>] ? dump_stack_print_info+0xe8/0xf1
         [<60282bc6>] ? rtmsg_ifinfo_build_skb+0xca/0x10d
         [<6006b116>] ? printk+0x0/0x94
         [<60371ee8>] dump_stack+0x2a/0x2c
         [<6003a68c>] __warn+0x10e/0x13e
         [<6003a82c>] warn_slowpath_null+0x48/0x4f
         [<60282bc6>] rtmsg_ifinfo_build_skb+0xca/0x10d
         [<60282c4d>] rtmsg_ifinfo_event.part.37+0x1e/0x43
         [<60282c2f>] ? rtmsg_ifinfo_event.part.37+0x0/0x43
         [<60282d03>] rtmsg_ifinfo+0x24/0x28
         [<60264e86>] dev_close_many+0xba/0x119
         [<60282cdf>] ? rtmsg_ifinfo+0x0/0x28
         [<6027c225>] ? rtnl_is_locked+0x0/0x1c
         [<6026ca67>] rollback_registered_many+0x1ae/0x4ae
         [<600314be>] ? unblock_signals+0x0/0xae
         [<6026cdc0>] ? unregister_netdevice_queue+0x19/0xec
         [<6026ceec>] unregister_netdevice_many+0x21/0xa1
         [<6027c765>] rtnl_delete_link+0x3e/0x4e
         [<60280ecb>] rtnl_dellink+0x262/0x29c
         [<6027c241>] ? rtnl_get_link+0x0/0x3e
         [<6027f867>] rtnetlink_rcv_msg+0x235/0x274
    =

        Fixes: be81a85f5f87 ("net: qualcomm: rmnet: Implement fill_info")
        Signed-off-by: Subash Abhinov Kasiviswanathan <subashab@codeauror=
a.org>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit b3d7e55c3f886493235bfee08e1e5a4a27cbcce8
    Author: Matt Redfearn <matt.redfearn@mips.com>
    Date:   Tue Apr 17 16:40:01 2018 +0100
    =

        MIPS: uaccess: Add micromips clobbers to bzero invocation
    =

        The micromips implementation of bzero additionally clobbers registe=
rs t7
        & t8. Specify this in the clobbers list when invoking bzero.
    =

        Fixes: 26c5e07d1478 ("MIPS: microMIPS: Optimise 'memset' core libra=
ry function.")
        Reported-by: James Hogan <jhogan@kernel.org>
        Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
        Cc: Ralf Baechle <ralf@linux-mips.org>
        Cc: linux-mips(a)linux-mips.org
        Cc: <stable@vger.kernel.org> # 3.10+
        Patchwork: https://patchwork.linux-mips.org/patch/19110/
        Signed-off-by: James Hogan <jhogan@kernel.org>
    =

    commit c96eebf07692e53bf4dd5987510d8b550e793598
    Author: Matt Redfearn <matt.redfearn@mips.com>
    Date:   Tue Apr 17 16:40:00 2018 +0100
    =

        MIPS: memset.S: Fix clobber of v1 in last_fixup
    =

        The label .Llast_fixup\@ is jumped to on page fault within the final
        byte set loop of memset (on < MIPSR6 architectures). For some reaso=
n, in
        this fault handler, the v1 register is randomly set to a2 & STORMAS=
K.
        This clobbers v1 for the calling function. This can be observed wit=
h the
        following test code:
    =

        static int __init __attribute__((optimize("O0"))) test_clear_user(v=
oid)
        {
          register int t asm("v1");
          char *test;
          int j, k;
    =

          pr_info("\n\n\nTesting clear_user\n");
          test =3D vmalloc(PAGE_SIZE);
    =

          for (j =3D 256; j < 512; j++) {
            t =3D 0xa5a5a5a5;
            if ((k =3D clear_user(test + PAGE_SIZE - 256, j)) !=3D j - 256)=
 {
                pr_err("clear_user (%px %d) returned %d\n", test + PAGE_SIZ=
E - 256, j, k);
            }
            if (t !=3D 0xa5a5a5a5) {
               pr_err("v1 was clobbered to 0x%x!\n", t);
            }
          }
    =

          return 0;
        }
        late_initcall(test_clear_user);
    =

        Which demonstrates that v1 is indeed clobbered (MIPS64):
    =

        Testing clear_user
        v1 was clobbered to 0x1!
        v1 was clobbered to 0x2!
        v1 was clobbered to 0x3!
        v1 was clobbered to 0x4!
        v1 was clobbered to 0x5!
        v1 was clobbered to 0x6!
        v1 was clobbered to 0x7!
    =

        Since the number of bytes that could not be set is already containe=
d in
        a2, the andi placing a value in v1 is not necessary and actively
        harmful in clobbering v1.
    =

        Reported-by: James Hogan <jhogan@kernel.org>
        Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
        Cc: Ralf Baechle <ralf@linux-mips.org>
        Cc: linux-mips(a)linux-mips.org
        Cc: stable(a)vger.kernel.org
        Patchwork: https://patchwork.linux-mips.org/patch/19109/
        Signed-off-by: James Hogan <jhogan@kernel.org>
    =

    commit 81c895072d29cd70eea5be1a8587cd6461c3715a
    Author: Bj=C3=B8rn Mork <bjorn@mork.no>
    Date:   Tue Apr 17 22:46:38 2018 +0200
    =

        tun: fix vlan packet truncation
    =

        Bogus trimming in tun_net_xmit() causes truncated vlan packets.
    =

        skb->len is correct whether or not skb_vlan_tag_present() is true. =
There
        is no more reason to adjust the skb length on xmit in this driver t=
han
        any other driver. tun_put_user() adds 4 bytes to the total for tagg=
ed
        packets because it transmits the tag inline to userspace.  This is
        similar to a nic transmitting the tag inline on the wire.
    =

        Reproducing the bug by sending any tagged packet through back-to-ba=
ck
        connected tap interfaces:
    =

         socat TUN,tun-type=3Dtap,iff-up,tun-name=3Din TUN,tun-type=3Dtap,i=
ff-up,tun-name=3Dout &
         ip link add link in name in.20 type vlan id 20
         ip addr add 10.9.9.9/24 dev in.20
         ip link set in.20 up
         tshark -nxxi in -f arp -c1 2>/dev/null &
         tshark -nxxi out -f arp -c1 2>/dev/null &
         ping -c 1 10.9.9.5 >/dev/null 2>&1
    =

        The output from the 'in' and 'out' interfaces are different when the
        bug is present:
    =

         Capturing on 'in'
         0000  ff ff ff ff ff ff 76 cf 76 37 d5 0a 81 00 00 14   ......v.v7=
......
         0010  08 06 00 01 08 00 06 04 00 01 76 cf 76 37 d5 0a   ..........=
v.v7..
         0020  0a 09 09 09 00 00 00 00 00 00 0a 09 09 05         ..........=
....
    =

         Capturing on 'out'
         0000  ff ff ff ff ff ff 76 cf 76 37 d5 0a 81 00 00 14   ......v.v7=
......
         0010  08 06 00 01 08 00 06 04 00 01 76 cf 76 37 d5 0a   ..........=
v.v7..
         0020  0a 09 09 09 00 00 00 00 00 00                     ..........
    =

        Fixes: aff3d70a07ff ("tun: allow to attach ebpf socket filter")
        Cc: Jason Wang <jasowang@redhat.com>
        Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
        Acked-by: Jason Wang <jasowang@redhat.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 36a50a989ee8267588de520b8704b85f045a3220
    Author: Tung Nguyen <tung.q.nguyen@dektech.com.au>
    Date:   Tue Apr 17 21:58:27 2018 +0200
    =

        tipc: fix infinite loop when dumping link monitor summary
    =

        When configuring the number of used bearers to MAX_BEARER and issui=
ng
        command "tipc link monitor summary", the command enters infinite lo=
op
        in user space.
    =

        This issue happens because function tipc_nl_node_dump_monitor() ret=
urns
        the wrong 'prev_bearer' value when all potential monitors have been
        scanned.
    =

        The correct behavior is to always try to scan all monitors until ei=
ther
        the netlink message is full, in which case we return the bearer ide=
ntity
        of the affected monitor, or we continue through the whole bearer ar=
ray
        until we can return MAX_BEARERS. This solution also caters for the =
case
        where there may be gaps in the bearer array.
    =

        Signed-off-by: Tung Nguyen <tung.q.nguyen@dektech.com.au>
        Signed-off-by: Jon Maloy <jon.maloy@ericsson.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit be47e41d77fba5bc17e9fb5f1c99217bb6691989
    Author: Jon Maloy <jon.maloy@ericsson.com>
    Date:   Tue Apr 17 21:25:42 2018 +0200
    =

        tipc: fix use-after-free in tipc_nametbl_stop
    =

        When we delete a service item in tipc_nametbl_stop() we loop over
        all service ranges in the service's RB tree, and for each service
        range we loop over its pertaining publications while calling
        tipc_service_remove_publ() for each of them.
    =

        However, tipc_service_remove_publ() has the side effect that it also
        removes the comprising service range item when there are no publica=
tions
        left. This leads to a "use-after-free" access when the inner loop
        continues to the next iteration, since the range item holding the l=
ist
        we are looping no longer exists.
    =

        We fix this by moving the delete of the service range item outside
        the said function. Instead, we now let the two functions calling it
        test if the list is empty and perform the removal when that is the
        case.
    =

        Reported-by: syzbot+d64b64afc55660106556(a)syzkaller.appspotmail.com
        Signed-off-by: Jon Maloy <jon.maloy@ericsson.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit b32e56e5a87a1f9243db92bc7a5df0ffb4627cfb
    Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
    Date:   Wed Apr 11 15:17:59 2018 +1000
    =

        powerpc/xive: Fix trying to "push" an already active pool VP
    =

        When setting up a CPU, we "push" (activate) a pool VP for it.
    =

        However it's an error to do so if it already has an active
        pool VP.
    =

        This happens when doing soft CPU hotplug on powernv since we
        don't tear down the CPU on unplug. The HW flags the error which
        gets captured by the diagnostics.
    =

        Fix this by making sure to "pull" out any already active pool
        first.
    =

        Fixes: 243e25112d06 ("powerpc/xive: Native exploitation of the XIVE=
 interrupt controller")
        Cc: stable(a)vger.kernel.org # v4.12+
        Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
        Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    =

    commit 44f06ba8297c7e9dfd0e49b40cbe119113cca094
    Author: Jan Kara <jack@suse.cz>
    Date:   Thu Apr 12 17:22:23 2018 +0200
    =

        udf: Fix leak of UTF-16 surrogates into encoded strings
    =

        OSTA UDF specification does not mention whether the CS0 charset in =
case
        of two bytes per character encoding should be treated in UTF-16 or
        UCS-2. The sample code in the standard does not treat UTF-16 surrog=
ates
        in any special way but on systems such as Windows which work in UTF=
-16
        internally, filenames would be treated as being in UTF-16 effective=
ly.
        In Linux it is more difficult to handle characters outside of Base
        Multilingual plane (beyond 0xffff) as NLS framework works with 2-by=
te
        characters only. Just make sure we don't leak UTF-16 surrogates int=
o the
        resulting string when loading names from the filesystem for now.
    =

        CC: stable(a)vger.kernel.org # >=3D v4.6
        Reported-by: Mingye Wang <arthur200126@gmail.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit 9c438d7a3a52dcc2b9ed095cb87d3a5e83cf7e60
    Author: Eric Biggers <ebiggers@google.com>
    Date:   Tue Apr 17 12:07:06 2018 -0700
    =

        KEYS: DNS: limit the length of option strings
    =

        Adding a dns_resolver key whose payload contains a very long option=
 name
        resulted in that string being printed in full.  This hit the WARN_O=
NCE()
        in set_precision() during the printk(), because printk() only suppo=
rts a
        precision of up to 32767 bytes:
    =

            precision 1000000 too large
            WARNING: CPU: 0 PID: 752 at lib/vsprintf.c:2189 vsnprintf+0x4bc=
/0x5b0
    =

        Fix it by limiting option strings (combined name + value) to a much=
 more
        reasonable 128 bytes.  The exact limit is arbitrary, but currently =
the
        only recognized option is formatted as "dnserror=3D%lu" which fits =
well
        within this limit.
    =

        Also ratelimit the printks.
    =

        Reproducer:
    =

            perl -e 'print "#", "A" x 1000000, "\x00"' | keyctl padd dns_re=
solver desc @s
    =

        This bug was found using syzkaller.
    =

        Reported-by: Mark Rutland <mark.rutland@arm.com>
        Fixes: 4a2d789267e0 ("DNS: If the DNS server returns an error, allo=
w that to be cached [ver #2]")
        Signed-off-by: Eric Biggers <ebiggers@google.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 89bda97b445bacab68e71507cc08ccacd6694474
    Author: Bert Kenward <bkenward@solarflare.com>
    Date:   Tue Apr 17 13:32:39 2018 +0100
    =

        sfc: check RSS is active for filter insert
    =

        For some firmware variants - specifically 'capture packed stream' -=
 RSS
        filters are not valid. We must check if RSS is actually active rath=
er
        than merely enabled.
    =

        Fixes: 42356d9a137b ("sfc: support RSS spreading of ethtool ntuple =
filters")
        Signed-off-by: Bert Kenward <bkenward@solarflare.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 7ce2367254e84753bceb07327aaf5c953cfce117
    Author: Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>
    Date:   Tue Apr 17 18:46:14 2018 +0900
    =

        vlan: Fix reading memory beyond skb->tail in skb_vlan_tagged_multi
    =

        Syzkaller spotted an old bug which leads to reading skb beyond tail=
 by 4
        bytes on vlan tagged packets.
        This is caused because skb_vlan_tagged_multi() did not check
        skb_headlen.
    =

        BUG: KMSAN: uninit-value in eth_type_vlan include/linux/if_vlan.h:2=
83 [inline]
        BUG: KMSAN: uninit-value in skb_vlan_tagged_multi include/linux/if_=
vlan.h:656 [inline]
        BUG: KMSAN: uninit-value in vlan_features_check include/linux/if_vl=
an.h:672 [inline]
        BUG: KMSAN: uninit-value in dflt_features_check net/core/dev.c:2949=
 [inline]
        BUG: KMSAN: uninit-value in netif_skb_features+0xd1b/0xdc0 net/core=
/dev.c:3009
        CPU: 1 PID: 3582 Comm: syzkaller435149 Not tainted 4.16.0+ #82
        Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
        Call Trace:
          __dump_stack lib/dump_stack.c:17 [inline]
          dump_stack+0x185/0x1d0 lib/dump_stack.c:53
          kmsan_report+0x142/0x240 mm/kmsan/kmsan.c:1067
          __msan_warning_32+0x6c/0xb0 mm/kmsan/kmsan_instr.c:676
          eth_type_vlan include/linux/if_vlan.h:283 [inline]
          skb_vlan_tagged_multi include/linux/if_vlan.h:656 [inline]
          vlan_features_check include/linux/if_vlan.h:672 [inline]
          dflt_features_check net/core/dev.c:2949 [inline]
          netif_skb_features+0xd1b/0xdc0 net/core/dev.c:3009
          validate_xmit_skb+0x89/0x1320 net/core/dev.c:3084
          __dev_queue_xmit+0x1cb2/0x2b60 net/core/dev.c:3549
          dev_queue_xmit+0x4b/0x60 net/core/dev.c:3590
          packet_snd net/packet/af_packet.c:2944 [inline]
          packet_sendmsg+0x7c57/0x8a10 net/packet/af_packet.c:2969
          sock_sendmsg_nosec net/socket.c:630 [inline]
          sock_sendmsg net/socket.c:640 [inline]
          sock_write_iter+0x3b9/0x470 net/socket.c:909
          do_iter_readv_writev+0x7bb/0x970 include/linux/fs.h:1776
          do_iter_write+0x30d/0xd40 fs/read_write.c:932
          vfs_writev fs/read_write.c:977 [inline]
          do_writev+0x3c9/0x830 fs/read_write.c:1012
          SYSC_writev+0x9b/0xb0 fs/read_write.c:1085
          SyS_writev+0x56/0x80 fs/read_write.c:1082
          do_syscall_64+0x309/0x430 arch/x86/entry/common.c:287
          entry_SYSCALL_64_after_hwframe+0x3d/0xa2
        RIP: 0033:0x43ffa9
        RSP: 002b:00007fff2cff3948 EFLAGS: 00000217 ORIG_RAX: 0000000000000=
014
        RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 000000000043ffa9
        RDX: 0000000000000001 RSI: 0000000020000080 RDI: 0000000000000003
        RBP: 00000000006cb018 R08: 0000000000000000 R09: 0000000000000000
        R10: 0000000000000000 R11: 0000000000000217 R12: 00000000004018d0
        R13: 0000000000401960 R14: 0000000000000000 R15: 0000000000000000
    =

        Uninit was created at:
          kmsan_save_stack_with_flags mm/kmsan/kmsan.c:278 [inline]
          kmsan_internal_poison_shadow+0xb8/0x1b0 mm/kmsan/kmsan.c:188
          kmsan_kmalloc+0x94/0x100 mm/kmsan/kmsan.c:314
          kmsan_slab_alloc+0x11/0x20 mm/kmsan/kmsan.c:321
          slab_post_alloc_hook mm/slab.h:445 [inline]
          slab_alloc_node mm/slub.c:2737 [inline]
          __kmalloc_node_track_caller+0xaed/0x11c0 mm/slub.c:4369
          __kmalloc_reserve net/core/skbuff.c:138 [inline]
          __alloc_skb+0x2cf/0x9f0 net/core/skbuff.c:206
          alloc_skb include/linux/skbuff.h:984 [inline]
          alloc_skb_with_frags+0x1d4/0xb20 net/core/skbuff.c:5234
          sock_alloc_send_pskb+0xb56/0x1190 net/core/sock.c:2085
          packet_alloc_skb net/packet/af_packet.c:2803 [inline]
          packet_snd net/packet/af_packet.c:2894 [inline]
          packet_sendmsg+0x6444/0x8a10 net/packet/af_packet.c:2969
          sock_sendmsg_nosec net/socket.c:630 [inline]
          sock_sendmsg net/socket.c:640 [inline]
          sock_write_iter+0x3b9/0x470 net/socket.c:909
          do_iter_readv_writev+0x7bb/0x970 include/linux/fs.h:1776
          do_iter_write+0x30d/0xd40 fs/read_write.c:932
          vfs_writev fs/read_write.c:977 [inline]
          do_writev+0x3c9/0x830 fs/read_write.c:1012
          SYSC_writev+0x9b/0xb0 fs/read_write.c:1085
          SyS_writev+0x56/0x80 fs/read_write.c:1082
          do_syscall_64+0x309/0x430 arch/x86/entry/common.c:287
          entry_SYSCALL_64_after_hwframe+0x3d/0xa2
    =

        Fixes: 58e998c6d239 ("offloading: Force software GSO for multiple v=
lan tags.")
        Reported-and-tested-by: syzbot+0bbe42c764feafa82c5a(a)syzkaller.app=
spotmail.com
        Signed-off-by: Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit daf70d89f80c6e1772233da9e020114b1254e7e0
    Author: Matt Redfearn <matt.redfearn@mips.com>
    Date:   Tue Apr 17 15:52:21 2018 +0100
    =

        MIPS: memset.S: Fix return of __clear_user from Lpartial_fixup
    =

        The __clear_user function is defined to return the number of bytes =
that
        could not be cleared. From the underlying memset / bzero implementa=
tion
        this means setting register a2 to that number on return. Currently =
if a
        page fault is triggered within the memset_partial block, the value
        loaded into a2 on return is meaningless.
    =

        The label .Lpartial_fixup\@ is jumped to on page fault. In order to=
 work
        out how many bytes failed to copy, the exception handler should fin=
d how
        many bytes left in the partial block (andi a2, STORMASK), add that =
to
        the partial block end address (a2), and subtract the faulting addre=
ss to
        get the remainder. Currently it incorrectly subtracts the partial b=
lock
        start address (t1), which has additionally been clobbered to genera=
te a
        jump target in memset_partial. Fix this by adding the block end add=
ress
        instead.
    =

        This issue was found with the following test code:
              int j, k;
              for (j =3D 0; j < 512; j++) {
                if ((k =3D clear_user(NULL, j)) !=3D j) {
                   pr_err("clear_user (NULL %d) returned %d\n", j, k);
                }
              }
        Which now passes on Creator Ci40 (MIPS32) and Cavium Octeon II (MIP=
S64).
    =

        Suggested-by: James Hogan <jhogan@kernel.org>
        Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
        Cc: Ralf Baechle <ralf@linux-mips.org>
        Cc: linux-mips(a)linux-mips.org
        Cc: stable(a)vger.kernel.org
        Patchwork: https://patchwork.linux-mips.org/patch/19108/
        Signed-off-by: James Hogan <jhogan@kernel.org>
    =

    commit 77ac725e0c5b27c925e514b999cd46d01eedafd1
    Author: Nicolas Dechesne <nicolas.dechesne@linaro.org>
    Date:   Tue Apr 17 14:03:26 2018 +0200
    =

        net: qrtr: add MODULE_ALIAS_NETPROTO macro
    =

        To ensure that qrtr can be loaded automatically, when needed, if it=
 is compiled
        as module.
    =

        Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 05e489b1596f0aa1025a1fa572676631cd9665da
    Author: Stefan Hajnoczi <stefanha@redhat.com>
    Date:   Tue Apr 17 14:25:58 2018 +0800
    =

        VSOCK: make af_vsock.ko removable again
    =

        Commit c1eef220c1760762753b602c382127bfccee226d ("vsock: always call
        vsock_init_tables()") introduced a module_init() function without a
        corresponding module_exit() function.
    =

        Modules with an init function can only be removed if they also have=
 an
        exit function.  Therefore the vsock module was considered "permanen=
t"
        and could not be removed.
    =

        This patch adds an empty module_exit() function so that "rmmod vsoc=
k"
        works.  No explicit cleanup is required because:
    =

        1. Transports call vsock_core_exit() upon exit and cannot be removed
           while sockets are still alive.
        2. vsock_diag.ko does not perform any action that requires cleanup =
by
           vsock.ko.
    =

        Fixes: c1eef220c176 ("vsock: always call vsock_init_tables()")
        Reported-by: Xiumei Mu <xmu@redhat.com>
        Cc: Cong Wang <xiyou.wangcong@gmail.com>
        Cc: Jorgen Hansen <jhansen@vmware.com>
        Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
        Reviewed-by: Jorgen Hansen <jhansen@vmware.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit ebf04f331fa15a966262341a7dc6b1a0efd633e4
    Author: Simon Gaiser <simon@invisiblethingslab.com>
    Date:   Thu Mar 15 04:08:03 2018 +0100
    =

        xen: xenbus_dev_frontend: Really return response string
    =

        xenbus_command_reply() did not actually copy the response string and
        leaked stack content instead.
    =

        Fixes: 9a6161fe73bd ("xen: return xenstore command failures via res=
ponse instead of rc")
        Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
        Reviewed-by: Juergen Gross <jgross@suse.com>
        Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    =

    commit cd6e992b3aab072cc90839508aaf5573c8f7e066
    Author: Oleksandr Andrushchenko <andr2000@gmail.com>
    Date:   Thu Apr 12 20:26:27 2018 +0300
    =

        xen/sndif: Sync up with the canonical definition in Xen
    =

        This is the sync up with the canonical definition of the sound
        protocol in Xen:
    =

        1. Protocol version was referenced in the protocol description,
           but missed its definition. Fixed by adding a constant
           for current protocol version.
    =

        2. Some of the request descriptions have "reserved" fields
           missed: fixed by adding corresponding entries.
    =

        3. Extend the size of the requests and responses to 64 octets.
           Bump protocol version to 2.
    =

        4. Add explicit back and front synchronization
           In order to provide explicit synchronization between backend and
           frontend the following changes are introduced in the protocol:
            - add new ring buffer for sending asynchronous events from
              backend to frontend to report number of bytes played by the
              frontend (XENSND_EVT_CUR_POS)
            - introduce trigger events for playback control: start/stop/pau=
se/resume
            - add "req-" prefix to event-channel and ring-ref to unify nami=
ng
              of the Xen event channels for requests and events
    =

        5. Add explicit back and front parameter negotiation
           In order to provide explicit stream parameter negotiation between
           backend and frontend the following changes are introduced in the=
 protocol:
           add XENSND_OP_HW_PARAM_QUERY request to read/update
           configuration space for the parameters given: request passes
           desired parameter's intervals/masks and the response to this req=
uest
           returns allowed min/max intervals/masks to be used.
    =

        Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@e=
pam.com>
        Signed-off-by: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
        Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
        Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
        Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
        Cc: Takashi Iwai <tiwai@suse.de>
        Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    =

    commit 3b2c77d000fe9f7d02e9e726e00dccf9f92b256f
    Author: Petr Mladek <pmladek@suse.com>
    Date:   Mon Apr 16 13:36:47 2018 +0200
    =

        livepatch: Allow to call a custom callback when freeing shadow vari=
ables
    =

        We might need to do some actions before the shadow variable is free=
d.
        For example, we might need to remove it from a list or free some da=
ta
        that it points to.
    =

        This is already possible now. The user can get the shadow variable
        by klp_shadow_get(), do the necessary actions, and then call
        klp_shadow_free().
    =

        This patch allows to do it a more elegant way. The user could imple=
ment
        the needed actions in a callback that is passed to klp_shadow_free()
        as a parameter. The callback usually does reverse operations to
        the constructor callback that can be called by klp_shadow_*alloc().
    =

        It is especially useful for klp_shadow_free_all(). There we need to=
 do
        these extra actions for each found shadow variable with the given I=
D.
    =

        Note that the memory used by the shadow variable itself is still re=
leased
        later by rcu callback. It is needed to protect internal structures =
that
        keep all shadow variables. But the destructor is called immediately.
        The shadow variable must not be access anyway after klp_shadow_free=
()
        is called. The user is responsible to protect this any suitable way.
    =

        Be aware that the destructor is called under klp_shadow_lock. It is
        the same as for the contructor in klp_shadow_alloc().
    =

        Signed-off-by: Petr Mladek <pmladek@suse.com>
        Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
        Acked-by: Miroslav Benes <mbenes@suse.cz>
        Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    =

    commit e91c2518a5d22a07642f35d85f39001ad379dae4
    Author: Petr Mladek <pmladek@suse.com>
    Date:   Mon Apr 16 13:36:46 2018 +0200
    =

        livepatch: Initialize shadow variables safely by a custom callback
    =

        The existing API allows to pass a sample data to initialize the sha=
dow
        data. It works well when the data are position independent. But it =
fails
        miserably when we need to set a pointer to the shadow structure its=
elf.
    =

        Unfortunately, we might need to initialize the pointer surprisingly
        often because of struct list_head. It is even worse because the list
        might be hidden in other common structures, for example, struct mut=
ex,
        struct wait_queue_head.
    =

        For example, this was needed to fix races in ALSA sequencer. It req=
uired
        to add mutex into struct snd_seq_client. See commit b3defb791b26ea06
        ("ALSA: seq: Make ioctls race-free") and commit d15d662e89fc667b9
        ("ALSA: seq: Fix racy pool initializations")
    =

        This patch makes the API more safe. A custom constructor function a=
nd data
        are passed to klp_shadow_*alloc() functions instead of the sample d=
ata.
    =

        Note that ctor_data are no longer a template for shadow->data. It m=
ight
        point to any data that might be necessary when the constructor is c=
alled.
    =

        Also note that the constructor is called under klp_shadow_lock. It =
is
        an internal spin_lock that synchronizes alloc() vs. get() operation=
s,
        see klp_shadow_get_or_alloc(). On one hand, this adds a risk of ABBA
        deadlocks. On the other hand, it allows to do some operations safel=
y.
        For example, we could add the new structure into an existing list.
        This must be done only once when the structure is allocated.
    =

        Reported-by: Nicolai Stange <nstange@suse.de>
        Signed-off-by: Petr Mladek <pmladek@suse.com>
        Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
        Acked-by: Miroslav Benes <mbenes@suse.cz>
        Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    =

    commit 9dfbf78e4114fcaf4ef61c49885c3ab5bad40d0b
    Author: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
    Date:   Thu Jan 18 00:33:36 2018 +0530
    =

        powerpc/64s: Default l1d_size to 64K in RFI fallback flush
    =

        If there is no d-cache-size property in the device tree, l1d_size c=
ould
        be zero. We don't actually expect that to happen, it's only been se=
en
        on mambo (simulator) in some configurations.
    =

        A zero-size l1d_size leads to the loop in the asm wrapping around to
        2^64-1, and then walking off the end of the fallback area and
        eventually causing a page fault which is fatal.
    =

        Just default to 64K which is correct on some CPUs, and sane enough =
to
        not cause a crash on others.
    =

        Fixes: aa8a5e0062ac9 ('powerpc/64s: Add support for RFI flush of L1=
-D cache')
        Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
        [mpe: Rewrite comment and change log]
        Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    =

    commit fae764912153065ea55eda47f834e0764a54df94
    Author: Martin Schwidefsky <schwidefsky@de.ibm.com>
    Date:   Thu Apr 12 13:48:25 2018 +0200
    =

        s390/signal: cleanup uapi struct sigaction
    =

        The struct sigaction for user space in arch/s390/include/uapi/asm/s=
ignal.h
        is ill defined. The kernel uses two structures 'struct sigaction' a=
nd
        'struct old_sigaction', the correlation in the kernel for both 31 a=
nd
        64 bit is as follows
    =

            sys_sigaction -> struct old_sigaction
            sys_rt_sigaction -> struct sigaction
    =

        The correlation of the (single) uapi definition for 'struct sigacti=
on'
        under '#ifndef __KERNEL__':
    =

            31-bit: sys_sigaction -> uapi struct sigaction
            31-bit: sys_rt_sigaction -> no structure available
    =

            64-bit: sys_sigaction -> no structure available
            64-bit: sys_rt_sigaction -> uapi struct sigaction
    =

        This is quite confusing. To make it a bit less confusing make the
        uapi definition of 'struct sigaction' usable for sys_rt_sigaction f=
or
        both 31-bit and 64-bit.
    =

        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 5968a70d7af5f2abbd9d9f9c8e86da51f0a6b16d
    Author: Randy Dunlap <rdunlap@infradead.org>
    Date:   Mon Apr 16 12:32:55 2018 -0700
    =

        textsearch: fix kernel-doc warnings and add kernel-api section
    =

        Make lib/textsearch.c usable as kernel-doc.
        Add textsearch() function family to kernel-api documentation.
        Fix kernel-doc warnings in <linux/textsearch.h>:
          ../include/linux/textsearch.h:65: warning: Incorrect use of kerne=
l-doc format:
                * get_next_block - fetch next block of data
          ../include/linux/textsearch.h:82: warning: Incorrect use of kerne=
l-doc format:
                * finish - finalize/clean a series of get_next_block() calls
    =

        Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit c6404122cb18f1fbd2a6dc85ab687f6fa2e454cf
    Author: Eric Dumazet <edumazet@google.com>
    Date:   Mon Apr 16 08:29:43 2018 -0700
    =

        tipc: fix possible crash in __tipc_nl_net_set()
    =

        syzbot reported a crash in __tipc_nl_net_set() caused by NULL deref=
erence.
    =

        We need to check that both TIPC_NLA_NET_NODEID and TIPC_NLA_NET_NOD=
EID_W1
        are present.
    =

        We also need to make sure userland provided u64 attributes.
    =

        Fixes: d50ccc2d3909 ("tipc: add 128-bit node identifier")
        Signed-off-by: Eric Dumazet <edumazet@google.com>
        Cc: Jon Maloy <jon.maloy@ericsson.com>
        Cc: Ying Xue <ying.xue@windriver.com>
        Reported-by: syzbot <syzkaller@googlegroups.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit ec518f21cb1a1b1f8a516499ea05c60299e04963
    Author: Eric Dumazet <edumazet@google.com>
    Date:   Mon Apr 16 08:29:42 2018 -0700
    =

        tipc: add policy for TIPC_NLA_NET_ADDR
    =

        Before syzbot/KMSAN bites, add the missing policy for TIPC_NLA_NET_=
ADDR
    =

        Fixes: 27c21416727a ("tipc: add net set to new netlink api")
        Signed-off-by: Eric Dumazet <edumazet@google.com>
        Cc: Jon Maloy <jon.maloy@ericsson.com>
        Cc: Ying Xue <ying.xue@windriver.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 8a8158c85e1e774a44fbe81106fa41138580dfd1
    Author: Matt Redfearn <matt.redfearn@mips.com>
    Date:   Thu Mar 29 10:28:23 2018 +0100
    =

        MIPS: memset.S: EVA & fault support for small_memset
    =

        The MIPS kernel memset / bzero implementation includes a small_mems=
et
        branch which is used when the region to be set is smaller than a lo=
ng (4
        bytes on 32bit, 8 bytes on 64bit). The current small_memset
        implementation uses a simple store byte loop to write the destinati=
on.
        There are 2 issues with this implementation:
    =

        1. When EVA mode is active, user and kernel address spaces may over=
lap.
        Currently the use of the sb instruction means kernel mode addressin=
g is
        always used and an intended write to userspace may actually overwri=
te
        some critical kernel data.
    =

        2. If the write triggers a page fault, for example by calling
        __clear_user(NULL, 2), instead of gracefully handling the fault, an=
 OOPS
        is triggered.
    =

        Fix these issues by replacing the sb instruction with the EX() macr=
o,
        which will emit EVA compatible instuctions as required. Additionally
        implement a fault fixup for small_memset which sets a2 to the numbe=
r of
        bytes that could not be cleared (as defined by __clear_user).
    =

        Reported-by: Chuanhua Lei <chuanhua.lei@intel.com>
        Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
        Cc: Ralf Baechle <ralf@linux-mips.org>
        Cc: linux-mips(a)linux-mips.org
        Cc: stable(a)vger.kernel.org
        Patchwork: https://patchwork.linux-mips.org/patch/18975/
        Signed-off-by: James Hogan <jhogan@kernel.org>
    =

    commit e86281e700cca8a773f9a572fa406adf2784ba5c
    Author: Tyler Hicks <tyhicks@canonical.com>
    Date:   Wed Mar 28 23:41:52 2018 +0000
    =

        eCryptfs: don't pass up plaintext names when using filename encrypt=
ion
    =

        Both ecryptfs_filldir() and ecryptfs_readlink_lower() use
        ecryptfs_decode_and_decrypt_filename() to translate lower filenames=
 to
        upper filenames. The function correctly passes up lower filenames,
        unchanged, when filename encryption isn't in use. However, it was a=
lso
        passing up lower filenames when the filename wasn't encrypted or
        when decryption failed. Since 88ae4ab9802e, eCryptfs refuses to loo=
kup
        lower plaintext names when filename encryption is enabled so this
        resulted in a situation where userspace would see lower plaintext
        filenames in calls to getdents(2) but then not be able to lookup th=
ose
        filenames.
    =

        An example of this can be seen when enabling filename encryption on=
 an
        eCryptfs mount at the root directory of an Ext4 filesystem:
    =

        $ ls -1i /lower
        12 ECRYPTFS_FNEK_ENCRYPTED.FWYZD8TcW.5FV-TKTEYOHsheiHX9a-w.NURCCYIM=
jI8pn5BDB9-h3fXwrE--
        11 lost+found
        $ ls -1i /upper
        ls: cannot access '/upper/lost+found': No such file or directory
         ? lost+found
        12 test
    =

        With this change, the lower lost+found dentry is ignored:
    =

        $ ls -1i /lower
        12 ECRYPTFS_FNEK_ENCRYPTED.FWYZD8TcW.5FV-TKTEYOHsheiHX9a-w.NURCCYIM=
jI8pn5BDB9-h3fXwrE--
        11 lost+found
        $ ls -1i /upper
        12 test
    =

        Additionally, some potentially noisy error/info messages in the rel=
ated
        code paths are turned into debug messages so that the logs can't be
        easily filled.
    =

        Fixes: 88ae4ab9802e ("ecryptfs_lookup(): try either only encrypted =
or plaintext name")
        Reported-by: Guenter Roeck <linux@roeck-us.net>
        Cc: Al Viro <viro@zeniv.linux.org.uk>
        Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
    =

    commit e6f39e87b6439939a14cb7fdd94086a082b63b87
    Author: Joerg Roedel <jroedel@suse.de>
    Date:   Mon Apr 16 11:43:57 2018 +0200
    =

        x86/ldt: Fix support_pte_mask filtering in map_ldt_struct()
    =

        The |=3D operator will let us end up with an invalid PTE. Use
        the correct &=3D instead.
    =

        [ The bug was also independently reported by Shuah Khan ]
    =

        Fixes: fb43d6cb91ef ('x86/mm: Do not auto-massage page protections')
        Acked-by: Andy Lutomirski <luto@kernel.org>
        Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
        Signed-off-by: Joerg Roedel <jroedel@suse.de>
        Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
    =

    commit 9783ccd0f2507cbe3c5ff1cb84bf6ae3a512d17d
    Author: Gao Feng <gfree.wind@vip.163.com>
    Date:   Mon Apr 16 10:16:45 2018 +0800
    =

        net: Fix one possible memleak in ip_setup_cork
    =

        It would allocate memory in this function when the cork->opt is NUL=
L. But
        the memory isn't freed if failed in the latter rt check, and return=
 error
        directly. It causes the memleak if its caller is ip_make_skb which =
also
        doesn't free the cork->opt when meet a error.
    =

        Now move the rt check ahead to avoid the memleak.
    =

        Signed-off-by: Gao Feng <gfree.wind@vip.163.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit d5edb7f8e7ab9fd5fd54a77d957b1733f117a813
    Author: Paolo Bonzini <pbonzini@redhat.com>
    Date:   Tue Mar 27 22:46:11 2018 +0200
    =

        kvm: selftests: add vmx_tsc_adjust_test
    =

        The test checks the behavior of setting MSR_IA32_TSC in a nested gu=
est,
        and the TSC_OFFSET VMCS field in general.  It also introduces the t=
esting
        infrastructure for Intel nested virtualization.
    =

        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit dd259935e4eec844dc3e5b8a7cd951cd658b4fb6
    Author: Paolo Bonzini <pbonzini@redhat.com>
    Date:   Fri Apr 13 11:38:35 2018 +0200
    =

        kvm: x86: move MSR_IA32_TSC handling to x86.c
    =

        This is not specific to Intel/AMD anymore.  The TSC offset is avail=
able
        in vcpu->arch.tsc_offset.
    =

        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit e79f245ddec17bbd89d73cd0169dba4be46c9b55
    Author: KarimAllah Ahmed <karahmed@amazon.de>
    Date:   Sat Apr 14 05:10:52 2018 +0200
    =

        X86/KVM: Properly update 'tsc_offset' to represent the running guest
    =

        Update 'tsc_offset' on vmentry/vmexit of L2 guests to ensure that i=
t always
        captures the TSC_OFFSET of the running guest whether it is the L1 o=
r L2
        guest.
    =

        Cc: Paolo Bonzini <pbonzini@redhat.com>
        Cc: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
        Cc: kvm(a)vger.kernel.org
        Cc: linux-kernel(a)vger.kernel.org
        Reviewed-by: Jim Mattson <jmattson@google.com>
        Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
        Signed-off-by: KarimAllah Ahmed <karahmed@amazon.de>
        [AMD changes, fix update_ia32_tsc_adjust_msr. - Paolo]
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit 5171b37d959641bbc619781caf62e61f7b940871
    Author: Eric Dumazet <edumazet@google.com>
    Date:   Sun Apr 15 17:52:04 2018 -0700
    =

        net: af_packet: fix race in PACKET_{R|T}X_RING
    =

        In order to remove the race caught by syzbot [1], we need
        to lock the socket before using po->tp_version as this could
        change under us otherwise.
    =

        This means lock_sock() and release_sock() must be done by
        packet_set_ring() callers.
    =

        [1] :
        BUG: KMSAN: uninit-value in packet_set_ring+0x1254/0x3870 net/packe=
t/af_packet.c:4249
        CPU: 0 PID: 20195 Comm: syzkaller707632 Not tainted 4.16.0+ #83
        Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
        Call Trace:
         __dump_stack lib/dump_stack.c:17 [inline]
         dump_stack+0x185/0x1d0 lib/dump_stack.c:53
         kmsan_report+0x142/0x240 mm/kmsan/kmsan.c:1067
         __msan_warning_32+0x6c/0xb0 mm/kmsan/kmsan_instr.c:676
         packet_set_ring+0x1254/0x3870 net/packet/af_packet.c:4249
         packet_setsockopt+0x12c6/0x5a90 net/packet/af_packet.c:3662
         SYSC_setsockopt+0x4b8/0x570 net/socket.c:1849
         SyS_setsockopt+0x76/0xa0 net/socket.c:1828
         do_syscall_64+0x309/0x430 arch/x86/entry/common.c:287
         entry_SYSCALL_64_after_hwframe+0x3d/0xa2
        RIP: 0033:0x449099
        RSP: 002b:00007f42b5307ce8 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
036
        RAX: ffffffffffffffda RBX: 000000000070003c RCX: 0000000000449099
        RDX: 0000000000000005 RSI: 0000000000000107 RDI: 0000000000000003
        RBP: 0000000000700038 R08: 000000000000001c R09: 0000000000000000
        R10: 00000000200000c0 R11: 0000000000000246 R12: 0000000000000000
        R13: 000000000080eecf R14: 00007f42b53089c0 R15: 0000000000000001
    =

        Local variable description: ----req_u(a)packet_setsockopt
        Variable was created at:
         packet_setsockopt+0x13f/0x5a90 net/packet/af_packet.c:3612
         SYSC_setsockopt+0x4b8/0x570 net/socket.c:1849
    =

        Fixes: f6fb8f100b80 ("af-packet: TPACKET_V3 flexible buffer impleme=
ntation.")
        Signed-off-by: Eric Dumazet <edumazet@google.com>
        Reported-by: syzbot <syzkaller@googlegroups.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit f23e0643cd0b53e68e283b6f26194d56c28a2eb1
    Author: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
    Date:   Sun Apr 15 18:53:36 2018 -0500
    =

        ibmvnic: Clear pending interrupt after device reset
    =

        Due to a firmware bug, the hypervisor can send an interrupt to a
        transmit or receive queue just prior to a partition migration, not
        allowing the device enough time to handle it and send an EOI. When
        the partition migrates, the interrupt is lost but an "EOI-pending"
        flag for the interrupt line is still set in firmware. No further
        interrupts will be sent until that flag is cleared, effectively
        freezing that queue. To workaround this, the driver will disable the
        hardware interrupt and send an H_EOI signal prior to re-enabling it.
        This will flush the pending EOI and allow the driver to continue
        operation.
    =

        Signed-off-by: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit bffd168c3fc5cc7d2bad4c668fa90e7a9010db4b
    Author: Soheil Hassas Yeganeh <soheil@google.com>
    Date:   Sat Apr 14 20:44:46 2018 -0400
    =

        tcp: clear tp->packets_out when purging write queue
    =

        Clear tp->packets_out when purging the write queue, otherwise
        tcp_rearm_rto() mistakenly assumes TCP write queue is not empty.
        This results in NULL pointer dereference.
    =

        Also, remove the redundant `tp->packets_out =3D 0` from
        tcp_disconnect(), since tcp_disconnect() calls
        tcp_write_queue_purge().
    =

        Fixes: a27fd7a8ed38 (tcp: purge write queue upon RST)
        Reported-by: Subash Abhinov Kasiviswanathan <subashab@codeaurora.=
org>
        Reported-by: Sami Farin <hvtaifwkbgefbaei@gmail.com>
        Tested-by: Sami Farin <hvtaifwkbgefbaei@gmail.com>
        Signed-off-by: Eric Dumazet <edumazet@google.com>
        Signed-off-by: Soheil Hassas Yeganeh <soheil@google.com>
        Acked-by: Yuchung Cheng <ycheng@google.com>
        Acked-by: Neal Cardwell <ncardwell@google.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 4fb0534fb7bbc2346ba7d3a072b538007f4135a5
    Author: Paolo Abeni <pabeni@redhat.com>
    Date:   Fri Apr 13 13:59:25 2018 +0200
    =

        team: avoid adding twice the same option to the event list
    =

        When parsing the options provided by the user space,
        team_nl_cmd_options_set() insert them in a temporary list to send
        multiple events with a single message.
        While each option's attribute is correctly validated, the code does
        not check for duplicate entries before inserting into the event
        list.
    =

        Exploiting the above, the syzbot was able to trigger the following
        splat:
    =

        kernel BUG at lib/list_debug.c:31!
        invalid opcode: 0000 [#1] SMP KASAN
        Dumping ftrace buffer:
            (ftrace buffer empty)
        Modules linked in:
        CPU: 0 PID: 4466 Comm: syzkaller556835 Not tainted 4.16.0+ #17
        Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS
        Google 01/01/2011
        RIP: 0010:__list_add_valid+0xaa/0xb0 lib/list_debug.c:29
        RSP: 0018:ffff8801b04bf248 EFLAGS: 00010286
        RAX: 0000000000000058 RBX: ffff8801c8fc7a90 RCX: 0000000000000000
        RDX: 0000000000000058 RSI: ffffffff815fbf41 RDI: ffffed0036097e3f
        RBP: ffff8801b04bf260 R08: ffff8801b0b2a700 R09: ffffed003b604f90
        R10: ffffed003b604f90 R11: ffff8801db027c87 R12: ffff8801c8fc7a90
        R13: ffff8801c8fc7a90 R14: dffffc0000000000 R15: 0000000000000000
        FS:  0000000000b98880(0000) GS:ffff8801db000000(0000) knlGS:0000000=
000000000
        CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
        CR2: 000000000043fc30 CR3: 00000001afe8e000 CR4: 00000000001406f0
        DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
        DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
        Call Trace:
          __list_add include/linux/list.h:60 [inline]
          list_add include/linux/list.h:79 [inline]
          team_nl_cmd_options_set+0x9ff/0x12b0 drivers/net/team/team.c:2571
          genl_family_rcv_msg+0x889/0x1120 net/netlink/genetlink.c:599
          genl_rcv_msg+0xc6/0x170 net/netlink/genetlink.c:624
          netlink_rcv_skb+0x172/0x440 net/netlink/af_netlink.c:2448
          genl_rcv+0x28/0x40 net/netlink/genetlink.c:635
          netlink_unicast_kernel net/netlink/af_netlink.c:1310 [inline]
          netlink_unicast+0x58b/0x740 net/netlink/af_netlink.c:1336
          netlink_sendmsg+0x9f0/0xfa0 net/netlink/af_netlink.c:1901
          sock_sendmsg_nosec net/socket.c:629 [inline]
          sock_sendmsg+0xd5/0x120 net/socket.c:639
          ___sys_sendmsg+0x805/0x940 net/socket.c:2117
          __sys_sendmsg+0x115/0x270 net/socket.c:2155
          SYSC_sendmsg net/socket.c:2164 [inline]
          SyS_sendmsg+0x29/0x30 net/socket.c:2162
          do_syscall_64+0x29e/0x9d0 arch/x86/entry/common.c:287
          entry_SYSCALL_64_after_hwframe+0x42/0xb7
        RIP: 0033:0x4458b9
        RSP: 002b:00007ffd1d4a7278 EFLAGS: 00000213 ORIG_RAX: 0000000000000=
02e
        RAX: ffffffffffffffda RBX: 000000000000001b RCX: 00000000004458b9
        RDX: 0000000000000010 RSI: 0000000020000d00 RDI: 0000000000000004
        RBP: 00000000004a74ed R08: 0000000000000000 R09: 0000000000000000
        R10: 0000000000000000 R11: 0000000000000213 R12: 00007ffd1d4a7348
        R13: 0000000000402a60 R14: 0000000000000000 R15: 0000000000000000
        Code: 75 e8 eb a9 48 89 f7 48 89 75 e8 e8 d1 85 7b fe 48 8b 75 e8 e=
b bb 48
        89 f2 48 89 d9 4c 89 e6 48 c7 c7 a0 84 d8 87 e8 ea 67 28 fe <0f> 0b=
 0f 1f
        40 00 48 b8 00 00 00 00 00 fc ff df 55 48 89 e5 41
        RIP: __list_add_valid+0xaa/0xb0 lib/list_debug.c:29 RSP: ffff8801b0=
4bf248
    =

        This changeset addresses the avoiding list_add() if the current
        option is already present in the event list.
    =

        Reported-and-tested-by: syzbot+4d4af685432dc0e56c91(a)syzkaller.app=
spotmail.com
        Signed-off-by: Paolo Abeni <pabeni@redhat.com>
        Fixes: 2fcdb2c9e659 ("team: allow to send multiple set events in on=
e message")
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit b8858581febb050688e276b956796bc4a78299ed
    Author: Michael Ellerman <mpe@ellerman.id.au>
    Date:   Mon Apr 16 23:25:19 2018 +1000
    =

        powerpc/lib: Fix off-by-one in alternate feature patching
    =

        When we patch an alternate feature section, we have to adjust any
        relative branches that branch out of the alternate section.
    =

        But currently we have a bug if we have a branch that points to past
        the last instruction of the alternate section, eg:
    =

          FTR_SECTION_ELSE
          1:     b       2f
                 or      6,6,6
          2:
          ALT_FTR_SECTION_END(...)
                 nop
    =

        This will result in a relative branch at 1 with a target that equals
        the end of the alternate section.
    =

        That branch does not need adjusting when it's moved to the non-else
        location. Currently we do adjust it, resulting in a branch that goes
        off into the link-time location of the else section, which is junk.
    =

        The fix is to not patch branches that have a target =3D=3D end of t=
he
        alternate section.
    =

        Fixes: d20fe50a7b3c ("KVM: PPC: Book3S HV: Branch inside feature se=
ction")
        Fixes: 9b1a735de64c ("powerpc: Add logic to patch alternative featu=
re sections")
        Cc: stable(a)vger.kernel.org # v2.6.27+
        Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    =

    commit de3d01fd8549ec0444fc917aab711b3f884930c5
    Author: Jia-Ju Bai <baijiaju1990@gmail.com>
    Date:   Wed Apr 11 09:15:31 2018 +0800
    =

        xen: xen-pciback: Replace GFP_ATOMIC with GFP_KERNEL in pcistub_reg=
_add
    =

        pcistub_reg_add() is never called in atomic context.
    =

        pcistub_reg_add() is only called by pcistub_quirk_add, which is
        only set in DRIVER_ATTR().
    =

        Despite never getting called from atomic context,
        pcistub_reg_add() calls kzalloc() with GFP_ATOMIC,
        which does not sleep for allocation.
        GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
        which can sleep and improve the possibility of sucessful allocation.
    =

        This is found by a static analysis tool named DCNS written by mysel=
f.
        And I also manually check it.
    =

        Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
        Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
        Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    =

    commit 230d211472d2779253e5a8383353fc44783dd038
    Author: Jia-Ju Bai <baijiaju1990@gmail.com>
    Date:   Mon Apr 9 23:04:25 2018 +0800
    =

        xen: xen-pciback: Replace GFP_ATOMIC with GFP_KERNEL in xen_pcibk_c=
onfig_quirks_init
    =

        xen_pcibk_config_quirks_init() is never called in atomic context.
    =

        The call chains ending up at xen_pcibk_config_quirks_init() are:
        [1] xen_pcibk_config_quirks_init() <- xen_pcibk_config_init_dev() <-
                pcistub_init_device() <- pcistub_seize() <- pcistub_probe()
        [2] xen_pcibk_config_quirks_init() <- xen_pcibk_config_init_dev() <-
                pcistub_init_device() <- pcistub_init_devices_late() <-
                xen_pcibk_init()
        pcistub_probe() is only set as ".probe" in struct pci_driver.
        xen_pcibk_init() is is only set as a parameter of module_init().
        These functions are not called in atomic context.
    =

        Despite never getting called from atomic context,
        xen_pcibk_config_quirks_init() calls kzalloc() with GFP_ATOMIC,
        which does not sleep for allocation.
        GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
        which can sleep and improve the possibility of sucessful allocation.
    =

        Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
        Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
        Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    =

    commit 9eb5f15b47b69847bfceb94350bd68fbdbf829e3
    Author: Jia-Ju Bai <baijiaju1990@gmail.com>
    Date:   Mon Apr 9 23:04:12 2018 +0800
    =

        xen: xen-pciback: Replace GFP_ATOMIC with GFP_KERNEL in pcistub_dev=
ice_alloc
    =

        pcistub_device_alloc() is never called in atomic context.
    =

        The call chain ending up at pcistub_device_alloc() is:
        [1] pcistub_device_alloc() <- pcistub_seize() <- pcistub_probe()
        pcistub_probe() is only set as ".probe" in struct pci_driver.
        This function is not called in atomic context.
    =

        Despite never getting called from atomic context,
        pcistub_device_alloc() calls kzalloc() with GFP_ATOMIC,
        which does not sleep for allocation.
        GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
        which can sleep and improve the possibility of sucessful allocation.
    =

        Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
        Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
        Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    =

    commit bb52e3169cb7dd5a9deea39b94342fce36235a5b
    Author: Jia-Ju Bai <baijiaju1990@gmail.com>
    Date:   Mon Apr 9 23:03:53 2018 +0800
    =

        xen: xen-pciback: Replace GFP_ATOMIC with GFP_KERNEL in pcistub_ini=
t_device
    =

        pcistub_init_device() is never called in atomic context.
    =

        The call chain ending up at pcistub_init_device() is:
        [1] pcistub_init_device() <- pcistub_seize() <- pcistub_probe()
        [2] pcistub_init_device() <- pcistub_init_devices_late() <-
                xen_pcibk_init()
        pcistub_probe() is only set as ".probe" in struct pci_driver.
        xen_pcibk_init() is is only set as a parameter of module_init().
        These functions are not called in atomic context.
    =

        Despite never getting called from atomic context,
        pcistub_init_device() calls kzalloc() with GFP_ATOMIC,
        which does not sleep for allocation.
        GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
        which can sleep and improve the possibility of sucessful allocation.
    =

        This is found by a static analysis tool named DCNS written by mysel=
f.
        And I also manually check it.
    =

        Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
        Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
        Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    =

    commit cc5cd5079699c7831fdc58e74352736706c3df3c
    Author: Jia-Ju Bai <baijiaju1990@gmail.com>
    Date:   Mon Apr 9 23:03:36 2018 +0800
    =

        xen: xen-pciback: Replace GFP_ATOMIC with GFP_KERNEL in pcistub_pro=
be
    =

        pcistub_probe() is never called in atomic context.
        This function is only set as ".probe" in struct pci_driver.
    =

        Despite never getting called from atomic context,
        pcistub_probe() calls kmalloc() with GFP_ATOMIC,
        which does not sleep for allocation.
        GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
        which can sleep and improve the possibility of sucessful allocation.
    =

        This is found by a static analysis tool named DCNS written by mysel=
f.
        And I also manually check it.
    =

        Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
        Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
        Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
    =

    commit 982e05001c472066ab288e4269ad6cab48889f0d
    Author: Maxime Chevallier <maxime.chevallier@bootlin.com>
    Date:   Mon Apr 16 10:07:23 2018 +0200
    =

        net: mvpp2: Fix TCAM filter reserved range
    =

        Marvell's PPv2 controller has a Packet Header parser, which uses a
        fixed-size TCAM array of filter entries.
    =

        The mvpp2 driver reserves some ranges among the 256 TCAM entries to
        perform MAC and VID filtering. The rest of the TCAM ids are freely =
usable
        for other features, such as IPv4 proto matching.
    =

        This commit fixes the MVPP2_PE_LAST_FREE_TID define that sets the e=
nd of
        the "free range", which included the MAC range. This could therefor=
e allow
        some other features to use entries dedicated to MAC filtering,
        lowering the number of unicast/multicast addresses that could be al=
lowed
        before switching to promiscuous mode.
    =

        Fixes: 10fea26ce2aa ("net: mvpp2: Add support for unicast filtering=
")
        Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit bd28899dd34f9283c567f7eeb31bb546f10820b5
    Author: Dan Carpenter <dan.carpenter@oracle.com>
    Date:   Mon Apr 16 13:17:50 2018 +0300
    =

        Revert "macsec: missing dev_put() on error in macsec_newlink()"
    =

        This patch is just wrong, sorry.  I was trying to fix a static chec=
ker
        warning and misread the code.  The reference taken in macsec_newlin=
k()
        is released in macsec_free_netdev() when the netdevice is destroyed.
    =

        This reverts commit 5dcd8400884cc4a043a6d4617e042489e5d566a9.
    =

        Reported-by: Laura Abbott <labbott@redhat.com>
        Fixes: 5dcd8400884c ("macsec: missing dev_put() on error in macsec_=
newlink()")
        Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
        Acked-by: Sabrina Dubroca <sd@queasysnail.net>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 2c2bf522ed8cbfaac666f7dc65cfd38de2b89f0f
    Author: Matt Redfearn <matt.redfearn@mips.com>
    Date:   Fri Apr 13 09:50:44 2018 +0100
    =

        MIPS: dts: Boston: Fix PCI bus dtc warnings:
    =

        dtc recently (v1.4.4-8-g756ffc4f52f6) added PCI bus checks. Fix the
        warnings now emitted:
    =

        arch/mips/boot/dts/img/boston.dtb: Warning (pci_bridge): /pci(a)100=
00000: missing bus-range for PCI bridge
        arch/mips/boot/dts/img/boston.dtb: Warning (pci_bridge): /pci(a)120=
00000: missing bus-range for PCI bridge
        arch/mips/boot/dts/img/boston.dtb: Warning (pci_bridge): /pci(a)140=
00000: missing bus-range for PCI bridge
    =

        Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
        Cc: Ralf Baechle <ralf@linux-mips.org>
        Cc: Paul Burton <paul.burton@mips.com>
        Cc: Rob Herring <robh+dt@kernel.org>
        Cc: Mark Rutland <mark.rutland@arm.com>
        Cc: linux-mips(a)linux-mips.org
        Cc: devicetree(a)vger.kernel.org
        Patchwork: https://patchwork.linux-mips.org/patch/19070/
        Signed-off-by: James Hogan <jhogan@kernel.org>
    =

    commit 49d23a851d62c03daebae2d245dcc9b07dbfa89f
    Author: Heiko Carstens <heiko.carstens@de.ibm.com>
    Date:   Thu Apr 12 11:01:07 2018 +0200
    =

        s390: rename default_defconfig to debug_defconfig
    =

        The name debug_defconfig reflects what the config is actually good
        for and should be less confusing.
    =

        Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit cd7cf57f18be4196306997d4325b8ebf895ab318
    Author: Heiko Carstens <heiko.carstens@de.ibm.com>
    Date:   Thu Apr 12 11:00:31 2018 +0200
    =

        s390: remove gcov defconfig
    =

        This config is not needed anymore.
    =

        Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit de2011197d15746307e709687401397fe52bea83
    Author: Martin Schwidefsky <schwidefsky@de.ibm.com>
    Date:   Mon Nov 20 08:48:02 2017 +0100
    =

        s390: update defconfig
    =

        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 06856938112b84ff3c6b0594d017f59cfda2a43d
    Author: Souptick Joarder <jrdr.linux@gmail.com>
    Date:   Sun Apr 15 01:03:42 2018 +0530
    =

        fs: ext2: Adding new return type vm_fault_t
    =

        Use new return type vm_fault_t for page_mkwrite,
        pfn_mkwrite and fault handler.
    =

        Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
        Reviewed-by: Matthew Wilcox <mawilcox@microsoft.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit 4f34a5130a471f32f2fe7750769ab4057dc3eaa0
    Author: Chengguang Xu <cgxu519@gmx.com>
    Date:   Sat Apr 14 20:16:06 2018 +0800
    =

        isofs: fix potential memory leak in mount option parsing
    =

        When specifying string type mount option (e.g., iocharset)
        several times in a mount, current option parsing may
        cause memory leak. Hence, call kfree for previous one
        in this case. Meanwhile, check memory allocation result
        for it.
    =

        Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit d93605407af34eb0b7eb8aff6b1eae2cde3cdd22
    Author: Ilya Dryomov <idryomov@gmail.com>
    Date:   Fri Mar 23 06:14:47 2018 +0100
    =

        rbd: notrim map option
    =

        Add an option to turn off discard and write zeroes offload support =
to
        avoid deprovisioning a fully provisioned image.  When enabled, disc=
ard
        requests will fail with -EOPNOTSUPP, write zeroes requests will fall
        back to manually zeroing.
    =

        Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
        Tested-by: Hitoshi Kamei <hitoshi.kamei.xm@hitachi.com>
    =

    commit 420efbdf4d2358dc12913298ad44d041c6ac0ed6
    Author: Ilya Dryomov <idryomov@gmail.com>
    Date:   Mon Apr 16 09:32:18 2018 +0200
    =

        rbd: adjust queue limits for "fancy" striping
    =

        In order to take full advantage of merging in ceph_file_to_extents(=
),
        allow object set sized I/Os.  If the layout is not "fancy", an obje=
ct
        set consists of just one object.
    =

        Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
    =

    commit c6244b3b23771b258656445dcd212be759265b84
    Author: Arnd Bergmann <arnd@arndb.de>
    Date:   Wed Apr 4 14:53:39 2018 +0200
    =

        rbd: avoid Wreturn-type warnings
    =

        In some configurations gcc cannot see that rbd_assert(0) leads to an
        unreachable code path:
    =

          drivers/block/rbd.c: In function 'rbd_img_is_write':
          drivers/block/rbd.c:1397:1: error: control reaches end of non-voi=
d function [-Werror=3Dreturn-type]
          drivers/block/rbd.c: In function '__rbd_obj_handle_request':
          drivers/block/rbd.c:2499:1: error: control reaches end of non-voi=
d function [-Werror=3Dreturn-type]
          drivers/block/rbd.c: In function 'rbd_obj_handle_write':
          drivers/block/rbd.c:2471:1: error: control reaches end of non-voi=
d function [-Werror=3Dreturn-type]
    =

        As the rbd_assert() here shows has no extra information beyond the =
verbose
        BUG(), we can simply use BUG() directly in its place.  This is reli=
ably
        detected as not returning on any architecture, since it doesn't dep=
end
        on the unlikely() comparison that confused gcc.
    =

        Fixes: 3da691bf4366 ("rbd: new request handling code")
        Signed-off-by: Arnd Bergmann <arnd@arndb.de>
        Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
        Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
    =

    commit ffdeec7aa41aa61ca4ee68fddf4669df9ce661d1
    Author: Yan, Zheng <zyan@redhat.com>
    Date:   Mon Mar 26 16:46:39 2018 +0800
    =

        ceph: always update atime/mtime/ctime for new inode
    =

        For new inode, atime/mtime/ctime are uninitialized.  Don't compare
        against them.
    =

        Cc: stable(a)kernel.org
        Signed-off-by: "Yan, Zheng" <zyan@redhat.com>
        Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
        Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
    =

    commit 34f55d0b3a0a39c95134c0c89173893b846d4c80
    Author: Dongsheng Yang <dongsheng.yang@easystack.cn>
    Date:   Mon Mar 26 10:22:55 2018 -0400
    =

        rbd: support timeout in rbd_wait_state_locked()
    =

        currently, the rbd_wait_state_locked() will wait forever if we
        can't get our state locked. Example:
    =

        rbd map --exclusive test1  --> /dev/rbd0
        rbd map test1  --> /dev/rbd1
        dd if=3D/dev/zero of=3D/dev/rbd1 bs=3D1M count=3D1 --> IO blocked
    =

        To avoid this problem, this patch introduce a timeout design
        in rbd_wait_state_locked(). Then rbd_wait_state_locked() will
        return error when we reach a timeout.
    =

        This patch allow user to set the lock_timeout in rbd mapping.
    =

        Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
        Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
        Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
    =

    commit 2f18d46683cb3047c41229d57cf7c6e2ee48676f
    Author: Ilya Dryomov <idryomov@gmail.com>
    Date:   Wed Apr 4 10:15:38 2018 +0200
    =

        rbd: refactor rbd_wait_state_locked()
    =

        In preparation for lock_timeout option, make rbd_wait_state_locked()
        return error codes.
    =

        Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
    =

    commit 451239eb3d397bd197a79cc3aab943da41ba0905
    Author: Heiko Carstens <heiko.carstens@de.ibm.com>
    Date:   Fri Apr 13 14:04:24 2018 +0200
    =

        s390: add support for IBM z14 Model ZR1
    =

        Just add the new machine type number to the two places that matter.
    =

        Cc: <stable@vger.kernel.org> # v4.14+
        Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit f43c426a581f04272a852f0486ae431acff6d87e
    Author: Vasily Gorbik <gor@linux.ibm.com>
    Date:   Fri Apr 13 10:57:27 2018 +0200
    =

        s390: remove couple of duplicate includes
    =

        Removing couple of duplicate includes, found by "make includecheck".
        That leaves 1 duplicate include in arch/s390/kernel/entry.S, which =
is
        there for a reason (it includes generated asm/syscall_table.h twice=
).
    =

        Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit c65bbb51c6e98a1956c08faab81941ec558ef0ba
    Author: Vasily Gorbik <gor@linux.ibm.com>
    Date:   Wed Apr 11 10:24:29 2018 +0200
    =

        s390/boot: remove unused COMPILE_VERSION and ccflags-y
    =

        ccflags-y has no effect (no code is built in that directory,
        arch/s390/boot/compressed/Makefile defines its own KBUILD_CFLAGS).
        Removing ccflags-y together with COMPILE_VERSION.
    =

        Reviewed-by: Heiko Carstens <heiko.carstens@de.ibm.com>
        Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 232acdff21fb02f0ccd538cd29c9ee7e028b6101
    Author: Sebastian Ott <sebott@linux.ibm.com>
    Date:   Tue Apr 10 12:39:34 2018 +0200
    =

        s390/nospec: include cpu.h
    =

        Fix the following sparse warnings:
        symbol 'cpu_show_spectre_v1' was not declared. Should it be static?
        symbol 'cpu_show_spectre_v2' was not declared. Should it be static?
    =

        Signed-off-by: Sebastian Ott <sebott@linux.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 701e188c6560d6abeba508f530c4224b4e830fb5
    Author: Thomas Richter <tmricht@linux.ibm.com>
    Date:   Thu Apr 12 08:42:48 2018 +0100
    =

        s390/decompressor: Ignore file vmlinux.bin.full
    =

        Commit 81796a3c6a4a ("s390/decompressor: trim uncompressed
        image head during the build") introduced a new
        file named vmlinux.bin.full in directory
        arch/s390/boot/compressed.
    =

        Add this file to the list of ignored files so it does
        not show up on git status.
    =

        Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit de66b2429100c85b72db5c409526351d3ffc5faa
    Author: Heiko Carstens <heiko.carstens@de.ibm.com>
    Date:   Thu Apr 12 13:45:52 2018 +0200
    =

        s390/kexec_file: add generated files to .gitignore
    =

        Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit bdea9f6f7a707301878573a5c35e39e4fe817378
    Author: Philipp Rudo <prudo@linux.vnet.ibm.com>
    Date:   Tue Mar 27 13:14:12 2018 +0200
    =

        s390/Kconfig: Move kexec config options to "Processor type and feat=
ures"
    =

        The config options for kexec are currently not under any menu direc=
tory. Up
        until now this was not a problem as standard kexec is always compil=
ed in
        and thus does not create a menu entry. This changed when kexec_file=
_load
        was enabled. Its config option requires a menu entry which, when ad=
ded
        beneath standard kexec option, appears on the main directory above =
"General
        Setup". Thus move the whole block further down such that the entry =
in now
        in "Processor type and features".
    =

        While at it also update the help text for kexec file.
    =

        Signed-off-by: Philipp Rudo <prudo@linux.vnet.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 8be018827154666d1fe5904cb7a43b6706e01c87
    Author: Philipp Rudo <prudo@linux.vnet.ibm.com>
    Date:   Mon Sep 11 15:15:29 2017 +0200
    =

        s390/kexec_file: Add ELF loader
    =

        Add an ELF loader for kexec_file. The main task here is to do prope=
r sanity
        checks on the ELF file. Basically all other functionality was alrea=
dy
        implemented for the image loader.
    =

        Signed-off-by: Philipp Rudo <prudo@linux.vnet.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit ee337f5469fd67f22d231e520ec4189ce0589d92
    Author: Philipp Rudo <prudo@linux.vnet.ibm.com>
    Date:   Tue Sep 5 11:55:23 2017 +0200
    =

        s390/kexec_file: Add crash support to image loader
    =

        Add support to load a crash kernel to the image loader. This requir=
es
        extending the purgatory.
    =

        Signed-off-by: Philipp Rudo <prudo@linux.vnet.ibm.com>
        Reviewed-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit e49bb0a27fa3c6ec45cc13e2102a6ec13c4ae697
    Author: Philipp Rudo <prudo@linux.vnet.ibm.com>
    Date:   Wed Aug 30 14:03:38 2017 +0200
    =

        s390/kexec_file: Add image loader
    =

        Add an image loader for kexec_file_load. For simplicity first skip =
crash
        support. The functions defined in machine_kexec_file will later be =
shared
        with the ELF loader.
    =

        Signed-off-by: Philipp Rudo <prudo@linux.vnet.ibm.com>
        Reviewed-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 71406883fd35794d573b3085433c41d0a3bf6c21
    Author: Philipp Rudo <prudo@linux.vnet.ibm.com>
    Date:   Mon Jun 19 10:45:33 2017 +0200
    =

        s390/kexec_file: Add kexec_file_load system call
    =

        This patch adds the kexec_file_load system call to s390 as well as =
the arch
        specific functions common code requires to work. Loaders for the di=
fferent
        file types will be added later.
    =

        Signed-off-by: Philipp Rudo <prudo@linux.vnet.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 840798a1f52994c172270893bd2ec6013cc92e40
    Author: Philipp Rudo <prudo@linux.vnet.ibm.com>
    Date:   Mon Aug 28 15:32:36 2017 +0200
    =

        s390/kexec_file: Add purgatory
    =

        The common code expects the architecture to have a purgatory that r=
uns
        between the two kernels. Add it now. For simplicity first skip crash
        support.
    =

        Signed-off-by: Philipp Rudo <prudo@linux.vnet.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 15ceb8c936d13d940ca9e53996fbd05a26ce96db
    Author: Philipp Rudo <prudo@linux.vnet.ibm.com>
    Date:   Tue Jun 27 12:44:11 2017 +0200
    =

        s390/kexec_file: Prepare setup.h for kexec_file_load
    =

        kexec_file_load needs to prepare the new kernels before they are lo=
aded.
        For that it has to know the offsets in head.S, e.g. to register the=
 new
        command line. Unfortunately there are no macros right now defining =
those
        offsets. Define them now.
    =

        Signed-off-by: Philipp Rudo <prudo@linux.vnet.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 760dd0eeaec1689430243ead14e5a429613d8c52
    Author: Martin Schwidefsky <schwidefsky@de.ibm.com>
    Date:   Tue Apr 3 11:08:52 2018 +0200
    =

        s390/smsgiucv: disable SMSG on module unload
    =

        The module exit function of the smsgiucv module uses the incorrect =
CP
        command to disable SMSG messages. The correct command is "SET SMSG =
OFF".
        Use it.
    =

        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit dccccd332d028f57358a8b64ca88e691fc8be5b7
    Author: Vasily Gorbik <gor@linux.ibm.com>
    Date:   Fri Apr 13 18:22:14 2018 +0200
    =

        s390/sclp: avoid potential usage of uninitialized value
    =

        sclp_early_printk could be used before .bss section is zeroed
        (i.e. from als.c during the decompressor phase), therefore values u=
sed
        by sclp_early_printk should be located in the .data section.
    =

        Another reason for that is to avoid potential initrd corruption, if=
 some
        code in future would use sclp_early_printk before initrd is moved f=
rom
        possibly overlapping with .bss section region to a safe location.
    =

        Fixes: 0b0d1173d8ae ("s390/sclp: 32 bit event mask compatibility mo=
de")
        Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
        Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
        Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
    =

    commit 8e04944f0ea8b838399049bdcda920ab36ae3b04
    Author: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
    Date:   Wed Apr 4 19:53:07 2018 +0900
    =

        mm,vmscan: Allow preallocating memory for register_shrinker().
    =

        syzbot is catching so many bugs triggered by commit 9ee332d99e4d5a97
        ("sget(): handle failures of register_shrinker()"). That commit exp=
ected
        that calling kill_sb() from deactivate_locked_super() without succe=
ssful
        fill_super() is safe, but the reality was different; some callers a=
ssign
        attributes which are needed for kill_sb() after sget() succeeds.
    =

        For example, [1] is a report where sb->s_mode (which seems to be ei=
ther
        FMODE_READ | FMODE_EXCL | FMODE_WRITE or FMODE_READ | FMODE_EXCL) i=
s not
        assigned unless sget() succeeds. But it does not worth complicate s=
get()
        so that register_shrinker() failure path can safely call
        kill_block_super() via kill_sb(). Making alloc_super() fail if memo=
ry
        allocation for register_shrinker() failed is much simpler. Let's av=
oid
        calling deactivate_locked_super() from sget_userns() by preallocati=
ng
        memory for the shrinker and making register_shrinker() in sget_user=
ns()
        never fail.
    =

        [1] https://syzkaller.appspot.com/bug?id=3D588996a25a2587be2e3a54e8=
646728fb9cae44e7
    =

        Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
        Reported-by: syzbot <syzbot+5a170e19c963a2e0df79@syzkaller.appspo=
tmail.com>
        Cc: Al Viro <viro@zeniv.linux.org.uk>
        Cc: Michal Hocko <mhocko@suse.com>
        Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
    =

    commit 4a3877c4cedd95543f8726b0a98743ed8db0c0fb
    Author: Al Viro <viro@zeniv.linux.org.uk>
    Date:   Tue Apr 3 01:15:46 2018 -0400
    =

        rpc_pipefs: fix double-dput()
    =

        if we ever hit rpc_gssd_dummy_depopulate() dentry passed to
        it has refcount equal to 1.  __rpc_rmpipe() drops it and
        dput() done after that hits an already freed dentry.
    =

        Cc: stable(a)kernel.org
        Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
    =

    commit 659038428cb43a66e3eff71e2c845c9de3611a98
    Author: Al Viro <viro@zeniv.linux.org.uk>
    Date:   Tue Apr 3 00:13:17 2018 -0400
    =

        orangefs_kill_sb(): deal with allocation failures
    =

        orangefs_fill_sb() might've failed to allocate ORANGEFS_SB(s); don't
        oops in that case.
    =

        Cc: stable(a)kernel.org
        Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
    =

    commit c66b23c2840446a82c389e4cb1a12eb2a71fa2e4
    Author: Al Viro <viro@zeniv.linux.org.uk>
    Date:   Mon Apr 2 23:56:44 2018 -0400
    =

        jffs2_kill_sb(): deal with failed allocations
    =

        jffs2_fill_super() might fail to allocate jffs2_sb_info;
        jffs2_kill_sb() must survive that.
    =

        Cc: stable(a)kernel.org
        Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
    =

    commit a24cd490739586a7d2da3549a1844e1d7c4f4fc4
    Author: Al Viro <viro@zeniv.linux.org.uk>
    Date:   Mon Apr 2 23:50:31 2018 -0400
    =

        hypfs_kill_super(): deal with failed allocations
    =

        hypfs_fill_super() might fail to allocate sbi; hypfs_kill_super()
        should not oops on that.
    =

        Cc: stable(a)vger.kernel.org
        Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
    =

    commit c246fd333f84e6a0a8572f991637aa102f5e1865
    Author: Wang Sheng-Hui <shhuiw@foxmail.com>
    Date:   Sun Apr 15 16:07:12 2018 +0800
    =

        filter.txt: update 'tools/net/' to 'tools/bpf/'
    =

        The tools are located at tootls/bpf/ instead of tools/net/.
        Update the filter.txt doc.
    =

        Signed-off-by: Wang Sheng-Hui <shhuiw@foxmail.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit f993740ee05821307eca03d23d468895740450f8
    Author: Edward Cree <ecree@solarflare.com>
    Date:   Fri Apr 13 19:18:09 2018 +0100
    =

        sfc: limit ARFS workitems in flight per channel
    =

        A misconfigured system (e.g. with all interrupts affinitised to all=
 CPUs)
         may produce a storm of ARFS steering events.  With the existing sf=
c ARFS
         implementation, that could create a backlog of workitems that grin=
ds the
         system to a halt.  To prevent this, limit the number of workitems =
that
         may be in flight for a given SFC device to 8 (EFX_RPS_MAX_IN_FLIGH=
T), and
         return EBUSY from our ndo_rx_flow_steer method if the limit is rea=
ched.
        Given this limit, also store the workitems in an array of slots wit=
hin the
         struct efx_nic, rather than dynamically allocating for each reques=
t.
        The limit should not negatively impact performance, because it is o=
nly
         likely to be hit in cases where ARFS will be ineffective anyway.
    =

        Signed-off-by: Edward Cree <ecree@solarflare.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit a7f80189e41c96c0c6210e9198a31859c91eb3e5
    Author: Edward Cree <ecree@solarflare.com>
    Date:   Fri Apr 13 19:17:49 2018 +0100
    =

        sfc: pass the correctly bogus filter_id to rps_may_expire_flow()
    =

        When we inserted an ARFS filter for ndo_rx_flow_steer(), we didn't =
know
         what the filter ID would be, so we just returned 0.  Thus, we must=
 also
         pass 0 as the filter ID when calling rps_may_expire_flow() for it,=
 and
         rely on the flow_id to identify what we're talking about.
    =

        Fixes: 3af0f34290f6 ("sfc: replace asynchronous filter operations")
        Signed-off-by: Edward Cree <ecree@solarflare.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 494bef4c2a087876e75f3e95f7f63b06d6a65921
    Author: Edward Cree <ecree@solarflare.com>
    Date:   Fri Apr 13 19:17:22 2018 +0100
    =

        sfc: insert ARFS filters with replace_equal=3Dtrue
    =

        Necessary to allow redirecting a flow when the application moves.
    =

        Fixes: 3af0f34290f6 ("sfc: replace asynchronous filter operations")
        Signed-off-by: Edward Cree <ecree@solarflare.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit c7cd882469fc5042a5c84122b4062d7f53076db7
    Author: Helge Deller <deller@gmx.de>
    Date:   Fri Apr 13 21:54:37 2018 +0200
    =

        parisc: Fix missing binfmt_elf32.o build error
    =

        Commit 71d577db01a5 ("parisc: Switch to generic COMPAT_BINFMT_ELF")
        removed the binfmt_elf32.c source file, but missed to drop the obje=
ct
        file from the list of object files the Makefile, which then results=
 in a
        build error.
    =

        Fixes: 71d577db01a5 ("parisc: Switch to generic COMPAT_BINFMT_ELF")
        Reported-by: Guenter Roeck <linux@roeck-us.net>
        Tested-by: Guenter Roeck <linux@roeck-us.net>
        Signed-off-by: Helge Deller <deller@gmx.de>
    =

    commit a1cc7034e33d12dc17d13fbcd7d597d552889097
    Author: Sinan Kaya <okaya@codeaurora.org>
    Date:   Thu Apr 12 22:30:44 2018 -0400
    =

        MIPS: io: Add barrier after register read in readX()
    =

        While a barrier is present in the writeX() functions before the reg=
ister
        write, a similar barrier is missing in the readX() functions after =
the
        register read. This could allow memory accesses following readX() to
        observe stale data.
    =

        Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
        Reported-by: Arnd Bergmann <arnd@arndb.de>
        Cc: Ralf Baechle <ralf@linux-mips.org>
        Cc: Paul Burton <paul.burton@mips.com>
        Cc: linux-mips(a)linux-mips.org
        Patchwork: https://patchwork.linux-mips.org/patch/19069/
        [jhogan(a)kernel.org: Tidy commit message]
        Signed-off-by: James Hogan <jhogan@kernel.org>
    =

    commit f726214d9b23e5fce8c11937577a289a3202498f
    Author: Guillaume Nault <g.nault@alphalink.fr>
    Date:   Thu Apr 12 20:50:35 2018 +0200
    =

        l2tp: hold reference on tunnels printed in l2tp/tunnels debugfs file
    =

        Use l2tp_tunnel_get_nth() instead of l2tp_tunnel_find_nth(), to be =
safe
        against concurrent tunnel deletion.
    =

        Use the same mechanism as in l2tp_ppp.c for dropping the reference
        taken by l2tp_tunnel_get_nth(). That is, drop the reference just
        before looking up the next tunnel. In case of error, drop the last
        accessed tunnel in l2tp_dfs_seq_stop().
    =

        That was the last use of l2tp_tunnel_find_nth().
    =

        Fixes: 0ad6614048cf ("l2tp: Add debugfs files for dumping l2tp debu=
g info")
        Signed-off-by: Guillaume Nault <g.nault@alphalink.fr>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 0e0c3fee3a59a387aeecc4fca6f3a2e9615a5443
    Author: Guillaume Nault <g.nault@alphalink.fr>
    Date:   Thu Apr 12 20:50:34 2018 +0200
    =

        l2tp: hold reference on tunnels printed in pppol2tp proc file
    =

        Use l2tp_tunnel_get_nth() instead of l2tp_tunnel_find_nth(), to be =
safe
        against concurrent tunnel deletion.
    =

        Unlike sessions, we can't drop the reference held on tunnels in
        pppol2tp_seq_show(). Tunnels are reused across several calls to
        pppol2tp_seq_start() when iterating over sessions. These iterations
        need the tunnel for accessing the next session. Therefore the only =
safe
        moment for dropping the reference is just before searching for the =
next
        tunnel.
    =

        Normally, the last invocation of pppol2tp_next_tunnel() doesn't find
        any new tunnel, so it drops the last tunnel without taking any new
        reference. However, in case of error, pppol2tp_seq_stop() is called
        directly, so we have to drop the reference there.
    =

        Fixes: fd558d186df2 ("l2tp: Split pppol2tp patch into separate l2tp=
 and ppp parts")
        Signed-off-by: Guillaume Nault <g.nault@alphalink.fr>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 5846c131c39b6d0add36ec19dc8650700690f930
    Author: Guillaume Nault <g.nault@alphalink.fr>
    Date:   Thu Apr 12 20:50:33 2018 +0200
    =

        l2tp: hold reference on tunnels in netlink dumps
    =

        l2tp_tunnel_find_nth() is unsafe: no reference is held on the retur=
ned
        tunnel, therefore it can be freed whenever the caller uses it.
        This patch defines l2tp_tunnel_get_nth() which works similarly, but
        also takes a reference on the returned tunnel. The caller then has =
to
        drop it after it stops using the tunnel.
    =

        Convert netlink dumps to make them safe against concurrent tunnel
        deletion.
    =

        Fixes: 309795f4bec2 ("l2tp: Add netlink control API for L2TP")
        Signed-off-by: Guillaume Nault <g.nault@alphalink.fr>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 9267c430c6b6f4c0120e3c6bb847313d633f02a6
    Author: Jason Wang <jasowang@redhat.com>
    Date:   Fri Apr 13 14:58:25 2018 +0800
    =

        virtio-net: add missing virtqueue kick when flushing packets
    =

        We tends to batch submitting packets during XDP_TX. This requires to
        kick virtqueue after a batch, we tried to do it through
        xdp_do_flush_map() which only makes sense for devmap not XDP_TX. So
        explicitly kick the virtqueue in this case.
    =

        Reported-by: Kimitoshi Takahashi <ktaka@nii.ac.jp>
        Tested-by: Kimitoshi Takahashi <ktaka@nii.ac.jp>
        Cc: Daniel Borkmann <daniel@iogearbox.net>
        Fixes: 186b3c998c50 ("virtio-net: support XDP_REDIRECT")
        Signed-off-by: Jason Wang <jasowang@redhat.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 96348e49366c6e2a5a2e62ba0350f66ef5d67ea7
    Author: Amir Goldstein <amir73il@gmail.com>
    Date:   Thu Apr 5 16:18:05 2018 +0300
    =

        MAINTAINERS: add an entry for FSNOTIFY infrastructure
    =

        There is alreay an entry for all the backends, but those entries do
        not cover all the fsnotify files.
    =

        Signed-off-by: Amir Goldstein <amir73il@gmail.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit 8e984f8667ff4225092af734eef28a3d7bae8626
    Author: Amir Goldstein <amir73il@gmail.com>
    Date:   Thu Apr 5 16:18:04 2018 +0300
    =

        fsnotify: fix typo in a comment about mark->g_list
    =

        Signed-off-by: Amir Goldstein <amir73il@gmail.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit 92183a42898dc400b89da35685d1814ac6acd3d8
    Author: Amir Goldstein <amir73il@gmail.com>
    Date:   Thu Apr 5 16:18:03 2018 +0300
    =

        fsnotify: fix ignore mask logic in send_to_group()
    =

        The ignore mask logic in send_to_group() does not match the logic
        in fanotify_should_send_event(). In the latter, a vfsmount mark ign=
ore
        mask precedes an inode mark mask and in the former, it does not.
    =

        That difference may cause events to be sent to fanotify backend for=
 no
        reason. Fix the logic in send_to_group() to match that of
        fanotify_should_send_event().
    =

        Signed-off-by: Amir Goldstein <amir73il@gmail.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit 2290482379278e0254e6edfdb681d88359143fd1
    Author: Richard Cochran <richardcochran@gmail.com>
    Date:   Mon Apr 9 00:03:14 2018 -0700
    =

        net: dsa: mv88e6xxx: Fix receive time stamp race condition.
    =

        The DSA stack passes received PTP frames to this driver via
        mv88e6xxx_port_rxtstamp() for deferred delivery.  The driver then
        queues the frame and kicks the worker thread.  The work callback re=
ads
        out the latched receive time stamp and then works through the queue,
        delivering any non-matching frames without a time stamp.
    =

        If a new frame arrives after the worker thread has read out the time
        stamp register but enters the queue before the worker finishes
        processing the queue, that frame will be delivered without a time
        stamp.
    =

        This patch fixes the race by moving the queue onto a list on the st=
ack
        before reading out the latched time stamp value.
    =

        Fixes: c6fe0ad2c3499 ("net: dsa: mv88e6xxx: add rx/tx timestamping =
support")
        Signed-off-by: Richard Cochran <richardcochran@gmail.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 53b76cdf7e8fecec1d09e38aad2f8579882591a8
    Author: Wolfgang Bumiller <w.bumiller@proxmox.com>
    Date:   Thu Apr 12 10:46:55 2018 +0200
    =

        net: fix deadlock while clearing neighbor proxy table
    =

        When coming from ndisc_netdev_event() in net/ipv6/ndisc.c,
        neigh_ifdown() is called with &nd_tbl, locking this while
        clearing the proxy neighbor entries when eg. deleting an
        interface. Calling the table's pndisc_destructor() with the
        lock still held, however, can cause a deadlock: When a
        multicast listener is available an IGMP packet of type
        ICMPV6_MGM_REDUCTION may be sent out. When reaching
        ip6_finish_output2(), if no neighbor entry for the target
        address is found, __neigh_create() is called with &nd_tbl,
        which it'll want to lock.
    =

        Move the elements into their own list, then unlock the table
        and perform the destruction.
    =

        Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D199289
        Fixes: 6fd6ce2056de ("ipv6: Do not depend on rt->n in ip6_finish_ou=
tput2().")
        Signed-off-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 1071ec9d453a38023579714b64a951a2fb982071
    Author: Xin Long <lucien.xin@gmail.com>
    Date:   Thu Apr 12 14:24:31 2018 +0800
    =

        sctp: do not check port in sctp_inet6_cmp_addr
    =

        pf->cmp_addr() is called before binding a v6 address to the sock. It
        should not check ports, like in sctp_inet_cmp_addr.
    =

        But sctp_inet6_cmp_addr checks the addr by invoking af(6)->cmp_addr,
        sctp_v6_cmp_addr where it also compares the ports.
    =

        This would cause that setsockopt(SCTP_SOCKOPT_BINDX_ADD) could bind
        multiple duplicated IPv6 addresses after Commit 40b4f0fd74e4 ("sctp:
        lack the check for ports in sctp_v6_cmp_addr").
    =

        This patch is to remove af->cmp_addr called in sctp_inet6_cmp_addr,
        but do the proper check for both v6 addrs and v4mapped addrs.
    =

        v1->v2:
          - define __sctp_v6_cmp_addr to do the common address comparison
            used for both pf and af v6 cmp_addr.
    =

        Fixes: 40b4f0fd74e4 ("sctp: lack the check for ports in sctp_v6_cmp=
_addr")
        Reported-by: Jianwen Ji <jiji@redhat.com>
        Signed-off-by: Xin Long <lucien.xin@gmail.com>
        Acked-by: Neil Horman <nhorman@tuxdriver.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit cf2cbadc20f5651c3dde9f5ac2ee52fb43aa4ddd
    Author: Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.co=
m>
    Date:   Wed Apr 11 16:47:38 2018 -0700
    =

        nfp: flower: split and limit cmsg skb lists
    =

        Introduce a second skb list for handling control messages and limit=
 the
        number of allowed messages. Some control messages are considered mo=
re
        crucial than others, resulting in the need for a second skb list. By
        splitting the list into a separate high and low priority list we can
        ensure that messages on the high list get added to the head of the =
list
        that gets processed, this however has no functional impact. Previou=
sly
        there was no limit on the number of messages allowed on the queue, =
this
        could result in the queue growing boundlessly and eventually the ho=
st
        running out of memory.
    =

        Fixes: b985f870a5f0 ("nfp: process control messages in workqueue in=
 flower app")
        Signed-off-by: Pieter Jansen van Vuuren <pieter.jansenvanvuuren@n=
etronome.com>
        Reviewed-by: Jakub Kicinski <jakub.kicinski@netronome.com>
        Reviewed-by: Simon Horman <simon.horman@netronome.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 0b1a989ef5a751b5992842d1934e22de861a848e
    Author: Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.co=
m>
    Date:   Wed Apr 11 16:47:37 2018 -0700
    =

        nfp: flower: move route ack control messages out of the workqueue
    =

        Previously we processed the route ack control messages in the workq=
ueue,
        this unnecessarily loads the workqueue. We can deal with these mess=
ages
        sooner as we know we are going to drop them.
    =

        Fixes: 8e6a9046b66a ("nfp: flower vxlan neighbour offload")
        Signed-off-by: Pieter Jansen van Vuuren <pieter.jansenvanvuuren@n=
etronome.com>
        Reviewed-by: Jakub Kicinski <jakub.kicinski@netronome.com>
        Reviewed-by: Simon Horman <simon.horman@netronome.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit bc05f9bcd8cb62f935625850e535da183b4a07c0
    Author: Jakub Kicinski <jakub.kicinski@netronome.com>
    Date:   Wed Apr 11 16:47:36 2018 -0700
    =

        nfp: print a message when mutex wait is interrupted
    =

        When waiting for an NFP mutex is interrupted print a message
        to make root causing later error messages easier.
    =

        Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
        Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 5496295aefe86995e41398b0f76de601308fc3f5
    Author: Jakub Kicinski <jakub.kicinski@netronome.com>
    Date:   Wed Apr 11 16:47:35 2018 -0700
    =

        nfp: ignore signals when communicating with management FW
    =

        We currently allow signals to interrupt the wait for management FW
        commands.  Exiting the wait should not cause trouble, the FW will
        just finish executing the command in the background and new commands
        will wait for the old one to finish.
    =

        However, this may not be what users expect (Ctrl-C not actually sto=
pping
        the command).  Moreover some systems routinely request link informa=
tion
        with signals pending (Ubuntu 14.04 runs a landscape-sysinfo python =
tool
        from MOTD) worrying users with errors like these:
    =

        nfp 0000:04:00.0: nfp_nsp: Error -512 waiting for code 0x0007 to st=
art
        nfp 0000:04:00.0: nfp: reading port table failed -512
    =

        Make the wait for management FW responses non-interruptible.
    =

        Fixes: 1a64821c6af7 ("nfp: add support for service processor access=
")
        Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
        Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 335b929b28aeb5bfc0698adb21deaf685b2982d1
    Author: Jon Maloy <jon.maloy@ericsson.com>
    Date:   Thu Apr 12 01:15:48 2018 +0200
    =

        tipc: fix missing initializer in tipc_sendmsg()
    =

        The stack variable 'dnode' in __tipc_sendmsg() may theoretically
        end up tipc_node_get_mtu() as an unitilalized variable.
    =

        We fix this by intializing the variable at declaration. We also add
        a default else clause to the two conditional ones already there, so
        that we never end up in the named function if the given address
        type is illegal.
    =

        Reported-by: syzbot+b0975ce9355b347c1546(a)syzkaller.appspotmail.com
        Signed-off-by: Jon Maloy <jon.maloy@ericsson.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 9d0c75bf6e03d9bf80c55b0f677dc9b982958fd5
    Author: Doron Roberts-Kedes <doronrk@fb.com>
    Date:   Wed Apr 11 15:05:16 2018 -0700
    =

        strparser: Fix incorrect strp->need_bytes value.
    =

        strp_data_ready resets strp->need_bytes to 0 if strp_peek_len indic=
ates
        that the remainder of the message has been received. However,
        do_strp_work does not reset strp->need_bytes to 0. If do_strp_work
        completes a partial message, the value of strp->need_bytes will con=
tinue
        to reflect the needed bytes of the previous message, causing
        future invocations of strp_data_ready to return early if
        strp->need_bytes is less than strp_peek_len. Resetting strp->need_b=
ytes
        to 0 in __strp_recv on handing a full message to the upper layer so=
lves
        this problem.
    =

        __strp_recv also calculates strp->need_bytes using stm->accum_len b=
efore
        stm->accum_len has been incremented by cand_len. This can cause
        strp->need_bytes to be equal to the full length of the message inst=
ead
        of the full length minus the accumulated length. This, in turn, cau=
ses
        strp_data_ready to return early, even when there is sufficient data=
 to
        complete the partial message. Incrementing stm->accum_len before us=
ing
        it to calculate strp->need_bytes solves this problem.
    =

        Found while testing net/tls_sw recv path.
    =

        Fixes: 43a0c6751a322847 ("strparser: Stream parser for messages")
        Signed-off-by: Doron Roberts-Kedes <doronrk@fb.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 5ff9c1a3dd92d2d8eeea6bb15b3502cfcc0e26fa
    Author: Anders Roxell <anders.roxell@linaro.org>
    Date:   Wed Apr 11 17:17:34 2018 +0200
    =

        selftests: net: add in_netns.sh to TEST_PROGS
    =

        Script in_netns.sh isn't installed.
        --------------------
        running psock_fanout test
        --------------------
        ./run_afpackettests: line 12: ./in_netns.sh: No such file or direct=
ory
        [FAIL]
        --------------------
        running psock_tpacket test
        --------------------
        ./run_afpackettests: line 22: ./in_netns.sh: No such file or direct=
ory
        [FAIL]
    =

        In current code added in_netns.sh to be installed.
    =

        Fixes: cc30c93fa020 ("selftests/net: ignore background traffic in p=
sock_fanout")
        Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
    =

        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit ebc701b796a67a5785399dcbc83d90e3b5f1e02f
    Author: Nathan Fontenot <nfont@linux.vnet.ibm.com>
    Date:   Wed Apr 11 10:09:38 2018 -0500
    =

        ibmvnic: Do not notify peers on parameter change resets
    =

        When attempting to change the driver parameters, such as the MTU
        value or number of queues, do not call netdev_notify_peers().
        Doing so will deadlock on the rtnl_lock.
    =

        Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 64d92aa2c9fe490ceffc440d7648ce369cd6cc3c
    Author: Nathan Fontenot <nfont@linux.vnet.ibm.com>
    Date:   Wed Apr 11 10:09:32 2018 -0500
    =

        ibmvnic: Handle all login error conditions
    =

        There is a bug in handling the possible return codes from sending t=
he
        login CRQ. The current code treats any non-success return value,
        minus failure to send the crq and a timeout waiting for a login res=
ponse,
        as a need to re-send the login CRQ. This can put the drive in an
        infinite loop of trying to login when getting return values other
        that a partial success such as a return code of aborted. For these
        scenarios the login will not ever succeed at this point and the
        driver would need to be reset again.
    =

        To resolve this loop trying to login is updated to only retry the
        login if the driver gets a return code of a partial success. Other
        return codes are treated as an error and the driver returns an error
        from ibmvnic_login().
    =

        To avoid infinite looping in the partial success return cases, the
        number of retries is capped at the maximum number of supported
        queues. This value was chosen because the driver does a renegotiati=
on
        of capabilities which sets the number of queues possible and allows
        the driver to attempt a login for possible value for the number
        of queues supported.
    =

        Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 7dd07c143a4b54d050e748bee4b4b9e94a7b1744
    Author: Eric Dumazet <edumazet@google.com>
    Date:   Wed Apr 11 14:46:00 2018 -0700
    =

        net: validate attribute sizes in neigh_dump_table()
    =

        Since neigh_dump_table() calls nlmsg_parse() without giving policy
        constraints, attributes can have arbirary size that we must validate
    =

        Reported by syzbot/KMSAN :
    =

        BUG: KMSAN: uninit-value in neigh_master_filtered net/core/neighbou=
r.c:2292 [inline]
        BUG: KMSAN: uninit-value in neigh_dump_table net/core/neighbour.c:2=
348 [inline]
        BUG: KMSAN: uninit-value in neigh_dump_info+0x1af0/0x2250 net/core/=
neighbour.c:2438
        CPU: 1 PID: 3575 Comm: syzkaller268891 Not tainted 4.16.0+ #83
        Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
        Call Trace:
         __dump_stack lib/dump_stack.c:17 [inline]
         dump_stack+0x185/0x1d0 lib/dump_stack.c:53
         kmsan_report+0x142/0x240 mm/kmsan/kmsan.c:1067
         __msan_warning_32+0x6c/0xb0 mm/kmsan/kmsan_instr.c:676
         neigh_master_filtered net/core/neighbour.c:2292 [inline]
         neigh_dump_table net/core/neighbour.c:2348 [inline]
         neigh_dump_info+0x1af0/0x2250 net/core/neighbour.c:2438
         netlink_dump+0x9ad/0x1540 net/netlink/af_netlink.c:2225
         __netlink_dump_start+0x1167/0x12a0 net/netlink/af_netlink.c:2322
         netlink_dump_start include/linux/netlink.h:214 [inline]
         rtnetlink_rcv_msg+0x1435/0x1560 net/core/rtnetlink.c:4598
         netlink_rcv_skb+0x355/0x5f0 net/netlink/af_netlink.c:2447
         rtnetlink_rcv+0x50/0x60 net/core/rtnetlink.c:4653
         netlink_unicast_kernel net/netlink/af_netlink.c:1311 [inline]
         netlink_unicast+0x1672/0x1750 net/netlink/af_netlink.c:1337
         netlink_sendmsg+0x1048/0x1310 net/netlink/af_netlink.c:1900
         sock_sendmsg_nosec net/socket.c:630 [inline]
         sock_sendmsg net/socket.c:640 [inline]
         ___sys_sendmsg+0xec0/0x1310 net/socket.c:2046
         __sys_sendmsg net/socket.c:2080 [inline]
         SYSC_sendmsg+0x2a3/0x3d0 net/socket.c:2091
         SyS_sendmsg+0x54/0x80 net/socket.c:2087
         do_syscall_64+0x309/0x430 arch/x86/entry/common.c:287
         entry_SYSCALL_64_after_hwframe+0x3d/0xa2
        RIP: 0033:0x43fed9
        RSP: 002b:00007ffddbee2798 EFLAGS: 00000213 ORIG_RAX: 0000000000000=
02e
        RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 000000000043fed9
        RDX: 0000000000000000 RSI: 0000000020005000 RDI: 0000000000000003
        RBP: 00000000006ca018 R08: 00000000004002c8 R09: 00000000004002c8
        R10: 00000000004002c8 R11: 0000000000000213 R12: 0000000000401800
        R13: 0000000000401890 R14: 0000000000000000 R15: 0000000000000000
    =

        Uninit was created at:
         kmsan_save_stack_with_flags mm/kmsan/kmsan.c:278 [inline]
         kmsan_internal_poison_shadow+0xb8/0x1b0 mm/kmsan/kmsan.c:188
         kmsan_kmalloc+0x94/0x100 mm/kmsan/kmsan.c:314
         kmsan_slab_alloc+0x11/0x20 mm/kmsan/kmsan.c:321
         slab_post_alloc_hook mm/slab.h:445 [inline]
         slab_alloc_node mm/slub.c:2737 [inline]
         __kmalloc_node_track_caller+0xaed/0x11c0 mm/slub.c:4369
         __kmalloc_reserve net/core/skbuff.c:138 [inline]
         __alloc_skb+0x2cf/0x9f0 net/core/skbuff.c:206
         alloc_skb include/linux/skbuff.h:984 [inline]
         netlink_alloc_large_skb net/netlink/af_netlink.c:1183 [inline]
         netlink_sendmsg+0x9a6/0x1310 net/netlink/af_netlink.c:1875
         sock_sendmsg_nosec net/socket.c:630 [inline]
         sock_sendmsg net/socket.c:640 [inline]
         ___sys_sendmsg+0xec0/0x1310 net/socket.c:2046
         __sys_sendmsg net/socket.c:2080 [inline]
         SYSC_sendmsg+0x2a3/0x3d0 net/socket.c:2091
         SyS_sendmsg+0x54/0x80 net/socket.c:2087
         do_syscall_64+0x309/0x430 arch/x86/entry/common.c:287
         entry_SYSCALL_64_after_hwframe+0x3d/0xa2
    =

        Fixes: 21fdd092acc7 ("net: Add support for filtering neigh dump by =
master device")
        Signed-off-by: Eric Dumazet <edumazet@google.com>
        Cc: David Ahern <dsa@cumulusnetworks.com>
        Reported-by: syzbot <syzkaller@googlegroups.com>
        Acked-by: David Ahern <dsa@cumulusnetworks.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 7212303268918b9a203aebeacfdbd83b5e87b20d
    Author: Eric Dumazet <edumazet@google.com>
    Date:   Wed Apr 11 14:36:28 2018 -0700
    =

        tcp: md5: reject TCP_MD5SIG or TCP_MD5SIG_EXT on established sockets
    =

        syzbot/KMSAN reported an uninit-value in tcp_parse_options() [1]
    =

        I believe this was caused by a TCP_MD5SIG being set on live
        flow.
    =

        This is highly unexpected, since TCP option space is limited.
    =

        For instance, presence of TCP MD5 option automatically disables
        TCP TimeStamp option at SYN/SYNACK time, which we can not do
        once flow has been established.
    =

        Really, adding/deleting an MD5 key only makes sense on sockets
        in CLOSE or LISTEN state.
    =

        [1]
        BUG: KMSAN: uninit-value in tcp_parse_options+0xd74/0x1a30 net/ipv4=
/tcp_input.c:3720
        CPU: 1 PID: 6177 Comm: syzkaller192004 Not tainted 4.16.0+ #83
        Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
        Call Trace:
         __dump_stack lib/dump_stack.c:17 [inline]
         dump_stack+0x185/0x1d0 lib/dump_stack.c:53
         kmsan_report+0x142/0x240 mm/kmsan/kmsan.c:1067
         __msan_warning_32+0x6c/0xb0 mm/kmsan/kmsan_instr.c:676
         tcp_parse_options+0xd74/0x1a30 net/ipv4/tcp_input.c:3720
         tcp_fast_parse_options net/ipv4/tcp_input.c:3858 [inline]
         tcp_validate_incoming+0x4f1/0x2790 net/ipv4/tcp_input.c:5184
         tcp_rcv_established+0xf60/0x2bb0 net/ipv4/tcp_input.c:5453
         tcp_v4_do_rcv+0x6cd/0xd90 net/ipv4/tcp_ipv4.c:1469
         sk_backlog_rcv include/net/sock.h:908 [inline]
         __release_sock+0x2d6/0x680 net/core/sock.c:2271
         release_sock+0x97/0x2a0 net/core/sock.c:2786
         tcp_sendmsg+0xd6/0x100 net/ipv4/tcp.c:1464
         inet_sendmsg+0x48d/0x740 net/ipv4/af_inet.c:764
         sock_sendmsg_nosec net/socket.c:630 [inline]
         sock_sendmsg net/socket.c:640 [inline]
         SYSC_sendto+0x6c3/0x7e0 net/socket.c:1747
         SyS_sendto+0x8a/0xb0 net/socket.c:1715
         do_syscall_64+0x309/0x430 arch/x86/entry/common.c:287
         entry_SYSCALL_64_after_hwframe+0x3d/0xa2
        RIP: 0033:0x448fe9
        RSP: 002b:00007fd472c64d38 EFLAGS: 00000216 ORIG_RAX: 0000000000000=
02c
        RAX: ffffffffffffffda RBX: 00000000006e5a30 RCX: 0000000000448fe9
        RDX: 000000000000029f RSI: 0000000020a88f88 RDI: 0000000000000004
        RBP: 00000000006e5a34 R08: 0000000020e68000 R09: 0000000000000010
        R10: 00000000200007fd R11: 0000000000000216 R12: 0000000000000000
        R13: 00007fff074899ef R14: 00007fd472c659c0 R15: 0000000000000009
    =

        Uninit was created at:
         kmsan_save_stack_with_flags mm/kmsan/kmsan.c:278 [inline]
         kmsan_internal_poison_shadow+0xb8/0x1b0 mm/kmsan/kmsan.c:188
         kmsan_kmalloc+0x94/0x100 mm/kmsan/kmsan.c:314
         kmsan_slab_alloc+0x11/0x20 mm/kmsan/kmsan.c:321
         slab_post_alloc_hook mm/slab.h:445 [inline]
         slab_alloc_node mm/slub.c:2737 [inline]
         __kmalloc_node_track_caller+0xaed/0x11c0 mm/slub.c:4369
         __kmalloc_reserve net/core/skbuff.c:138 [inline]
         __alloc_skb+0x2cf/0x9f0 net/core/skbuff.c:206
         alloc_skb include/linux/skbuff.h:984 [inline]
         tcp_send_ack+0x18c/0x910 net/ipv4/tcp_output.c:3624
         __tcp_ack_snd_check net/ipv4/tcp_input.c:5040 [inline]
         tcp_ack_snd_check net/ipv4/tcp_input.c:5053 [inline]
         tcp_rcv_established+0x2103/0x2bb0 net/ipv4/tcp_input.c:5469
         tcp_v4_do_rcv+0x6cd/0xd90 net/ipv4/tcp_ipv4.c:1469
         sk_backlog_rcv include/net/sock.h:908 [inline]
         __release_sock+0x2d6/0x680 net/core/sock.c:2271
         release_sock+0x97/0x2a0 net/core/sock.c:2786
         tcp_sendmsg+0xd6/0x100 net/ipv4/tcp.c:1464
         inet_sendmsg+0x48d/0x740 net/ipv4/af_inet.c:764
         sock_sendmsg_nosec net/socket.c:630 [inline]
         sock_sendmsg net/socket.c:640 [inline]
         SYSC_sendto+0x6c3/0x7e0 net/socket.c:1747
         SyS_sendto+0x8a/0xb0 net/socket.c:1715
         do_syscall_64+0x309/0x430 arch/x86/entry/common.c:287
         entry_SYSCALL_64_after_hwframe+0x3d/0xa2
    =

        Fixes: cfb6eeb4c860 ("[TCP]: MD5 Signature Option (RFC2385) support=
.")
        Signed-off-by: Eric Dumazet <edumazet@google.com>
        Reported-by: syzbot <syzkaller@googlegroups.com>
        Acked-by: Yuchung Cheng <ycheng@google.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit c3317f4db831b7564ff8d1670326456a7fbbbcb3
    Author: Jon Maloy <jon.maloy@ericsson.com>
    Date:   Wed Apr 11 22:52:09 2018 +0200
    =

        tipc: fix unbalanced reference counter
    =

        When a topology subscription is created, we may encounter (or KASAN
        may provoke) a failure to create a corresponding service instance in
        the binding table. Instead of letting the tipc_nametbl_subscribe()
        report the failure back to the caller, the function just makes a wa=
rning
        printout and returns, without incrementing the subscription referen=
ce
        counter as expected by the caller.
    =

        This makes the caller believe that the subscription was successful,=
 so
        it will at a later moment try to unsubscribe the item. This involves
        a sub_put() call. Since the reference counter never was incremented
        in the first place, we get a premature delete of the subscription i=
tem,
        followed by a "use-after-free" warning.
    =

        We fix this by adding a return value to tipc_nametbl_subscribe() and
        make the caller aware of the failure to subscribe.
    =

        This bug seems to always have been around, but this fix only applies
        back to the commit shown below. Given the low risk of this happening
        we believe this to be sufficient.
    =

        Fixes: commit 218527fe27ad ("tipc: replace name table service range
        array with rb tree")
        Reported-by: syzbot+aa245f26d42b8305d157(a)syzkaller.appspotmail.com
    =

        Signed-off-by: Jon Maloy <jon.maloy@ericsson.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 1c2734b31d72316e3faaad88c0c9c46fa92a4b20
    Author: Raghuram Chary J <raghuramchary.jallipalli@microchip.com>
    Date:   Wed Apr 11 20:36:36 2018 +0530
    =

        lan78xx: PHY DSP registers initialization to address EEE link drop =
issues with long cables
    =

        The patch is to configure DSP registers of PHY device
        to handle Gbe-EEE failures with >40m cable length.
    =

        Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/=
1000 Ethernet device driver")
        Signed-off-by: Raghuram Chary J <raghuramchary.jallipalli@microch=
ip.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 9a4381618262157586051f5ba0db42df3c6ab4b5
    Author: Laura Abbott <labbott@redhat.com>
    Date:   Tue Apr 10 18:04:29 2018 -0700
    =

        mISDN: Remove VLAs
    =

        There's an ongoing effort to remove VLAs[1] from the kernel to even=
tually
        turn on -Wvla. Remove the VLAs from the mISDN code by switching to =
using
        kstrdup in one place and using an upper bound in another.
    =

        Signed-off-by: Laura Abbott <labbott@redhat.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit b16520f7493d06d8ef6d4255bdfcf7a803d7874a
    Author: Kees Cook <keescook@chromium.org>
    Date:   Tue Apr 10 17:52:34 2018 -0700
    =

        net/tls: Remove VLA usage
    =

        In the quest to remove VLAs from the kernel[1], this replaces the V=
LA
        size with the only possible size used in the code, and adds a mecha=
nism
        to double-check future IV sizes.
    =

        [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=
=3DqPXydAacU1RqZWA(a)mail.gmail.com
    =

        Signed-off-by: Kees Cook <keescook@chromium.org>
        Acked-by: Dave Watson <davejwatson@fb.com>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit 08ea556e14b56e9a49b19abd8e39f0c9e05582f2
    Author: Kees Cook <keescook@chromium.org>
    Date:   Tue Apr 10 15:26:43 2018 -0700
    =

        ibmvnic: Define vnic_login_client_data name field as unsized array
    =

        The "name" field of struct vnic_login_client_data is a char array of
        undefined length. This should be written as "char name[]" so the co=
mpiler
        can make better decisions about the field (for example, not assuming
        it's a single character). This was noticed while trying to tighten =
the
        CONFIG_FORTIFY_SOURCE checking.
    =

        Signed-off-by: Kees Cook <keescook@chromium.org>
        Signed-off-by: David S. Miller <davem@davemloft.net>
    =

    commit f6b7aeee8f167409195fbf1364d02988fecad1d0
    Author: Sinan Kaya <okaya@codeaurora.org>
    Date:   Tue Apr 3 08:55:03 2018 -0400
    =

        MIPS: io: Prevent compiler reordering writeX()
    =

        writeX() has strong ordering semantics with respect to memory updat=
es.
        In the absence of a write barrier or a compiler barrier, the compil=
er
        can reorder register and memory update instructions. This breaks the
        writeX() API.
    =

        Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
        Cc: Arnd Bergmann <arnd@arndb.de>
        Cc: Ralf Baechle <ralf@linux-mips.org>
        Cc: Paul Burton <paul.burton@mips.com>
        Cc: linux-mips(a)linux-mips.org
        Patchwork: https://patchwork.linux-mips.org/patch/18997/
        [jhogan(a)kernel.org: Tidy commit message]
        Signed-off-by: James Hogan <jhogan@kernel.org>
    =

    commit 4e1acd7b31a03f24cc6108d37d005e6b1d48c5d3
    Author: Peng Hao <peng.hao2@zte.com.cn>
    Date:   Fri Apr 13 08:36:30 2018 +0800
    =

        kvm: selftests: add -std=3Dgnu99 cflags
    =

        lib/kvm_util.c: In function =E2=80=98kvm_memcmp_hva_gva=E2=80=99:
        lib/kvm_util.c:332:2: error: =E2=80=98for=E2=80=99 loop initial dec=
larations are only allowed in C99 mode
    =

        So add -std=3Dgnu99 to CFLAGS
    =

        Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit f0f4cf5b306620282db0c59ff963012e1973e025
    Author: Krish Sadhukhan <krish.sadhukhan@oracle.com>
    Date:   Wed Apr 11 01:10:16 2018 -0400
    =

        x86: Add check for APIC access address for vmentry of L2 guests
    =

        According to the sub-section titled 'VM-Execution Control Fields' i=
n the
        section titled 'Basic VM-Entry Checks' in Intel SDM vol. 3C, the fo=
llowing
        vmentry check must be enforced:
    =

            If the 'virtualize APIC-accesses' VM-execution control is 1, the
            APIC-access address must satisfy the following checks:
    =

                - Bits 11:0 of the address must be 0.
                - The address should not set any bits beyond the processor's
                  physical-address width.
    =

        This patch adds the necessary check to conform to this rule. If the=
 check
        fails, we cause the L2 VMENTRY to fail which is what the associated=
 unit
        test (following patch) expects.
    =

        Reviewed-by: Mihai Carabas <mihai.carabas@oracle.com>
        Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
        Reviewed-by: Jim Mattson <jmattson@google.com>
        Reviewed-by: Wanpeng Li <wanpengli@tencent.com>
        Signed-off-by: Krish Sadhukhan <krish.sadhukhan@oracle.com>
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit 3e83eda467050f13fa69d888993458b76e733de9
    Author: Aaron Ma <aaron.ma@canonical.com>
    Date:   Mon Apr 9 15:41:31 2018 +0800
    =

        HID: i2c-hid: Fix resume issue on Raydium touchscreen device
    =

        When Rayd touchscreen resumed from S3, it issues too many errors li=
ke:
        i2c_hid i2c-RAYD0001:00: i2c_hid_get_input: incomplete report (58/5=
442)
    =

        And all the report data are corrupted, touchscreen is unresponsive.
    =

        Fix this by re-sending report description command after resume.
        Add device ID as a quirk.
    =

        Cc: stable(a)vger.kernel.org
        Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
        Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    =

    commit 619d3a2922ce623ca2eca443cc936810d328317c
    Author: Aaron Armstrong Skomra <skomra@gmail.com>
    Date:   Wed Apr 4 14:24:11 2018 -0700
    =

        HID: wacom: bluetooth: send exit report for recent Bluetooth devices
    =

        The code path for recent Bluetooth devices omits an exit report whi=
ch
        resets all the values of the device.
    =

        Fixes: 4922cd26f0 ("HID: wacom: Support 2nd-gen Intuos Pro's Blueto=
oth classic interface")
        Cc: <stable@vger.kernel.org> # 4.11
        Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
        Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
        Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    =

    commit 2698d82e519413c6ad287e6f14b29e0373ed37f8
    Author: hu huajun <huhuajun@linux.alibaba.com>
    Date:   Wed Apr 11 15:16:40 2018 +0800
    =

        KVM: X86: fix incorrect reference of trace_kvm_pi_irte_update
    =

        In arch/x86/kvm/trace.h, this function is declared as host_irq the
        first input, and vcpu_id the second, instead of otherwise.
    =

        Signed-off-by: hu huajun <huhuajun@linux.alibaba.com>
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit 8e9b29b61851ba452e33373743fadb52778e9075
    Author: KarimAllah Ahmed <karahmed@amazon.de>
    Date:   Wed Apr 11 11:16:03 2018 +0200
    =

        X86/KVM: Do not allow DISABLE_EXITS_MWAIT when LAPIC ARAT is not av=
ailable
    =

        If the processor does not have an "Always Running APIC Timer" (aka =
ARAT),
        we should not give guests direct access to MWAIT. The LAPIC timer w=
ould
        stop ticking in deep C-states, so any host deadlines would not wake=
up the
        host kernel.
    =

        The host kernel intel_idle driver handles this by switching to broa=
dcast
        mode when ARAT is not available and MWAIT is issued with a deep C-s=
tate
        that would stop the LAPIC timer. When MWAIT is passed through, we c=
an not
        tell when MWAIT is issued.
    =

        So just disable this capability when LAPIC ARAT is not available. I=
 am not
        even sure if there are any CPUs with VMX support but no LAPIC ARAT =
or not.
    =

        Cc: Paolo Bonzini <pbonzini@redhat.com>
        Cc: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
        Reported-by: Wanpeng Li <kernellwp@gmail.com>
        Signed-off-by: KarimAllah Ahmed <karahmed@amazon.de>
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit 5ac7c2fd6e7102532104907c0df94abca826ec5c
    Author: Kyle Spiers <ksspiers@google.com>
    Date:   Tue Apr 10 17:02:29 2018 -0700
    =

        isofs compress: Remove VLA usage
    =

        As part of the effort to remove VLAs from the kernel[1], this chang=
es
        the allocation of the bhs and pages arrays from being on the stack =
to being
        kcalloc()ed. This also allows for the removal of the explicit zeroi=
ng
        of bhs.
    =

        https://lkml.org/lkml/2018/3/7/621
    =

        Signed-off-by: Kyle Spiers <ksspiers@google.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit 4d5f26ee310237552a36aa14ceee96d6659153cd
    Author: Colin Ian King <colin.king@canonical.com>
    Date:   Tue Apr 10 13:38:56 2018 +0100
    =

        kvm: selftests: fix spelling mistake: "divisable" and "divisible"
    =

        Trivial fix to spelling mistakes in comment and message text
    =

        Signed-off-by: Colin Ian King <colin.king@canonical.com>
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit 386c6ddbda180676b7d9fc375d54a7bdd353d39e
    Author: KarimAllah Ahmed <karahmed@amazon.de>
    Date:   Tue Apr 10 14:15:46 2018 +0200
    =

        X86/VMX: Disable VMX preemption timer if MWAIT is not intercepted
    =

        The VMX-preemption timer is used by KVM as a way to set deadlines f=
or the
        guest (i.e. timer emulation). That was safe till very recently when
        capability KVM_X86_DISABLE_EXITS_MWAIT to disable intercepting MWAI=
T was
        introduced. According to Intel SDM 25.5.1:
    =

        """
        The VMX-preemption timer operates in the C-states C0, C1, and C2; i=
t also
        operates in the shutdown and wait-for-SIPI states. If the timer cou=
nts down
        to zero in any state other than the wait-for SIPI state, the logical
        processor transitions to the C0 C-state and causes a VM exit; the t=
imer
        does not cause a VM exit if it counts down to zero in the wait-for-=
SIPI
        state. The timer is not decremented in C-states deeper than C2.
        """
    =

        Now once the guest issues the MWAIT with a c-state deeper than
        C2 the preemption timer will never wake it up again since it stopped
        ticking! Usually this is compensated by other activities in the sys=
tem that
        would wake the core from the deep C-state (and cause a VMExit). For
        example, if the host itself is ticking or it received interrupts, e=
tc!
    =

        So disable the VMX-preemption timer if MWAIT is exposed to the gues=
t!
    =

        Cc: Paolo Bonzini <pbonzini@redhat.com>
        Cc: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
        Cc: kvm(a)vger.kernel.org
        Signed-off-by: KarimAllah Ahmed <karahmed@amazon.de>
        Fixes: 4d5422cea3b61f158d58924cbb43feada456ba5c
        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    =

    commit 1aa3b3e0cbdb32439f04842e88fc7557a0777660
    Author: Jia-Ju Bai <baijiaju1990@gmail.com>
    Date:   Mon Apr 9 22:31:19 2018 +0800
    =

        fs: quota: Replace GFP_ATOMIC with GFP_KERNEL in dquot_init
    =

        dquot_init() is never called in atomic context.
        This function is only set as a parameter of fs_initcall().
    =

        Despite never getting called from atomic context,
        dquot_init() calls __get_free_pages() with GFP_ATOMIC,
        which waits busily for allocation.
        GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
        to avoid busy waiting and improve the possibility of sucessful allo=
cation.
    =

        This is found by a static analysis tool named DCNS written by mysel=
f.
        And I also manually check it.
    =

        Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit 54a307ba8d3cd00a3902337ffaae28f436eeb1a4
    Author: Amir Goldstein <amir73il@gmail.com>
    Date:   Wed Apr 4 23:42:18 2018 +0300
    =

        fanotify: fix logic of events on child
    =

        When event on child inodes are sent to the parent inode mark and
        parent inode mark was not marked with FAN_EVENT_ON_CHILD, the event
        will not be delivered to the listener process. However, if the same
        process also has a mount mark, the event to the parent inode will be
        delivered regadless of the mount mark mask.
    =

        This behavior is incorrect in the case where the mount mark mask do=
es
        not contain the specific event type. For example, the process adds
        a mark on a directory with mask FAN_MODIFY (without FAN_EVENT_ON_CH=
ILD)
        and a mount mark with mask FAN_CLOSE_NOWRITE (without FAN_ONDIR).
    =

        A modify event on a file inside that directory (and inside that mou=
nt)
        should not create a FAN_MODIFY event, because neither of the marks
        requested to get that event on the file.
    =

        Fixes: 1968f5eed54c ("fanotify: use both marks when possible")
        Cc: stable <stable@vger.kernel.org>
        Signed-off-by: Amir Goldstein <amir73il@gmail.com>
        Signed-off-by: Jan Kara <jack@suse.cz>
    =

    commit a955358d54695e4ad9f7d6489a7ac4d69a8fc711
    Author: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
    Date:   Fri Apr 6 01:09:36 2018 +0200
    =

        HID: hidraw: Fix crash on HIDIOCGFEATURE with a destroyed device
    =

        Doing `ioctl(HIDIOCGFEATURE)` in a tight loop on a hidraw device
        and then disconnecting the device, or unloading the driver, can
        cause a NULL pointer dereference.
    =

        When a hidraw device is destroyed it sets 0 to `dev->exist`.
        Most functions check 'dev->exist' before doing its work, but
        `hidraw_get_report()` was missing that check.
    =

        Cc: stable(a)vger.kernel.org
        Signed-off-by: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
        Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    =

    commit 2e210bbb7429cdcf1a1a3ad00c1bf98bd9bf2452
    Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
    Date:   Tue Apr 3 10:52:20 2018 -0700
    =

        HID: input: fix battery level reporting on BT mice
    =

        The commit 581c4484769e ("HID: input: map digitizer battery usage")
        assumed that devices having input (qas opposed to feature) report f=
or
        battery strength would report the data on their own, without the ne=
ed to
        be polled by the kernel; unfortunately it is not so. Many wireless =
mice
        do not send unsolicited reports with battery strength data and have=
 to
        be polled explicitly. As a complication, stylus devices on digitize=
rs
        are not normally connected to the base and thus can not be polled -=
 the
        base can only determine battery strength in the stylus when it is in
        proximity.
    =

        To solve this issue, we add a special flag that tells the kernel
        to avoid polling the device (and expect unsolicited reports) and se=
t it
        when report field with physical usage of digitizer stylus (HID_DG_S=
TYLUS).
        Unless this flag is set, and we have not seen the unsolicited repor=
ts,
        the kernel will attempt to poll the device when userspace attempts =
to
        read "capacity" and "state" attributes of power_supply object
        corresponding to the devices battery.
    =

        Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
        Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D198095
        Cc: stable(a)vger.kernel.org
        Reported-and-tested-by: Martin van Es <martin@mrvanes.com>
        Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
        Signed-off-by: Jiri Kosina <jkosina@suse.cz>
    =

    commit 0136c741ff40e03323419feec05fcd594f36a463
    Author: Anson Huang <Anson.Huang@nxp.com>
    Date:   Wed Mar 28 11:22:38 2018 +0800
    =

        clocksource/drivers/imx-tpm: Add different counter width support
    =

        Different TPM modules have different width counters which is 16-bit=
 or 32-bit,
        the counter width can be read from TPM_PARAM register bit[23:16], t=
his patch
        adds dynamic check for counter width to support both 16-bit and 32-=
bit TPM
        modules.
    =

        Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
        Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
    =

    commit 506a7be93ff773d5d4cf75a59f342865605b4910
    Author: Anson Huang <Anson.Huang@nxp.com>
    Date:   Wed Mar 28 11:22:37 2018 +0800
    =

        clocksource/drivers/imx-tpm: Correct some registers operation flow
    =

        According to i.MX7ULP reference manual, TPM_SC_CPWMS can ONLY be wr=
itten when
        counter is disabled, TPM_SC_TOF is write-1-clear, TPM_C0SC_CHF is a=
lso
        write-1-clear, correct these registers initialization flow;
    =

        Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
        Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
    =

    commit 16328e7bd428937f557a984d8b3378387c17a930
    Author: Anson Huang <Anson.Huang@nxp.com>
    Date:   Wed Mar 28 11:22:36 2018 +0800
    =

        clocksource/drivers/imx-tpm: Fix typo of clock name
    =

        The clock name should be ipg instead of igp.
    =

        Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
        Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
    =

    commit cc01456a0d9a3cbfec85cf23f2ce53323e8fc973
    Author: Anson Huang <Anson.Huang@nxp.com>
    Date:   Wed Mar 28 11:22:35 2018 +0800
    =

        dt-bindings: timer: tpm: fix typo of clock name
    =

        The clock name should be ipg instead of igp.
    =

        Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
        Reviewed-by: Rob Herring <robh@kernel.org>
        Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
    =

    commit 1c00289ecd12471ba9733e61aaf1d39883a77b16
    Author: Tomer Maimon <tmaimon77@gmail.com>
    Date:   Thu Mar 8 17:24:58 2018 +0200
    =

        clocksource/drivers/npcm: Add NPCM7xx timer driver
    =

        Add Nuvoton BMC NPCM7xx timer driver.
    =

        The clocksource Enable 24-bit TIMER0 and TIMER1 counters,
        while TIMER0 serve as clockevent and TIMER1 serve as clocksource.
    =

        Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
        Reviewed-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
        Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
    =

    commit ff2969c479d97c6221a9835ee0ab4c44513badc6
    Author: Tomer Maimon <tmaimon77@gmail.com>
    Date:   Thu Mar 8 17:24:57 2018 +0200
    =

        dt-binding: timer: document NPCM7xx timer DT bindings
    =

        Added device tree binding documentation for Nuvoton NPCM7xx timer.
    =

        Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
        Acked-by: Rob Herring <robh@kernel.org>
        Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
        Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
    =

    commit f62fd7a77717350e850f3c4a5373fe8e64871025
    Author: Colin Ian King <colin.king@canonical.com>
    Date:   Fri Mar 2 09:07:08 2018 +0000
    =

        ecryptfs: fix spelling mistake: "cadidate" -> "candidate"
    =

        Trivial fix to spelling mistake in debug message text.
    =

        Signed-off-by: Colin Ian King <colin.king@canonical.com>
        Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
    =

    commit ab13a9218c9883d1f51940b9e720c63ef54a2c07
    Author: Guenter Roeck <linux@roeck-us.net>
    Date:   Thu Jan 18 18:40:25 2018 -0800
    =

        ecryptfs: lookup: Don't check if mount_crypt_stat is NULL
    =

        mount_crypt_stat is assigned to
        &ecryptfs_superblock_to_private(ecryptfs_dentry->d_sb)->mount_crypt=
_stat,
        and mount_crypt_stat is not the first object in struct ecryptfs_sb_=
info.
        mount_crypt_stat is therefore never NULL. At the same time, no crash
        in ecryptfs_lookup() has been reported, and the lookup functions in
        other file systems don't check if d_sb is NULL either.
        Given that, remove the NULL check.
    =

        Signed-off-by: Guenter Roeck <linux@roeck-us.net>
        Signed-off-by: Tyler Hicks <tyhicks@canonical.com>

60cc43fc88  Linux 4.17-rc1
486ad79630  origin
37ee4b8879  pci: test for unexpectedly disabled bridges
+------------------------------------------+-----------+------------+------=
------+
|                                          | v4.17-rc1 | 486ad79630 | mmotm=
/v4.1 |
+------------------------------------------+-----------+------------+------=
------+
| boot_successes                           | 81        | 4          | 0    =
      |
| boot_failures                            | 0         | 11         | 11   =
      |
| BUG:unable_to_handle_kernel              | 0         | 11         | 11   =
      |
| Oops:#[##]                               | 0         | 11         | 11   =
      |
| RIP:llc_ui_release                       | 0         | 11         | 11   =
      |
| Kernel_panic-not_syncing:Fatal_exception | 0         | 11         | 11   =
      |
+------------------------------------------+-----------+------------+------=
------+

[main] Setsockopt(101 c 1b24000 a) on fd 177 [3:5:240]
[main] Setsockopt(1 2c 1b24000 4) on fd 178 [5:2:0]
[main] Setsockopt(29 8 1b24000 4) on fd 180 [10:1:0]
[main] Setsockopt(1 20 1b24000 4) on fd 181 [26:2:125]
[main] Setsockopt(11 1 1b24000 4) on fd 183 [2:2:17]
[   15.532543] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000004
[   15.534143] PGD 800000001734b067 P4D 800000001734b067 PUD 17350067 PMD 0 =

[   15.535516] Oops: 0002 [#1] PTI
[   15.536165] Modules linked in:
[   15.536798] CPU: 0 PID: 363 Comm: trinity-main Not tainted 4.17.0-rc1-00=
001-g486ad79 #2
[   15.538396] RIP: 0010:llc_ui_release+0x3a/0xd0
[   15.539293] RSP: 0018:ffffc9000015bd70 EFLAGS: 00010202
[   15.540345] RAX: 0000000000000001 RBX: ffff88001fa60008 RCX: 00000000000=
00006
[   15.541802] RDX: 0000000000000006 RSI: ffff88001fdda660 RDI: ffff88001fa=
60008
[   15.543139] RBP: ffffc9000015bd80 R08: 0000000000000000 R09: 00000000000=
00000
[   15.544725] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[   15.546287] R13: ffff88001fa61730 R14: ffff88001e130a60 R15: ffff880019b=
db3f0
[   15.547962] FS:  00007f2221bb1700(0000) GS:ffffffff82034000(0000) knlGS:=
0000000000000000
[   15.549848] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   15.551186] CR2: 0000000000000004 CR3: 000000001734e000 CR4: 00000000000=
006b0
[   15.552671] DR0: 0000000002232000 DR1: 0000000000000000 DR2: 00000000000=
00000
[   15.554105] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 00000000000=
00600
[   15.555534] Call Trace:
[   15.556049]  sock_release+0x14/0x60
[   15.556767]  sock_close+0xd/0x20
[   15.557427]  __fput+0xba/0x1f0
[   15.558058]  ____fput+0x9/0x10
[   15.558682]  task_work_run+0x73/0xa0
[   15.559416]  do_exit+0x231/0xab0
[   15.560079]  do_group_exit+0x3f/0xc0
[   15.560810]  __x64_sys_exit_group+0x13/0x20
[   15.561656]  do_syscall_64+0x58/0x2f0
[   15.562407]  ? trace_hardirqs_off_thunk+0x1a/0x1c
[   15.563360]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   15.564471] RIP: 0033:0x7f2221696408
[   15.565264] RSP: 002b:00007ffe5c544c48 EFLAGS: 00000206 ORIG_RAX: 000000=
00000000e7
[   15.566924] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f22216=
96408
[   15.568485] RDX: 0000000000000000 RSI: 000000000000003c RDI: 00000000000=
00000
[   15.570046] RBP: 0000000000000000 R08: 00000000000000e7 R09: fffffffffff=
fffa0
[   15.571603] R10: 00007ffe5c5449e0 R11: 0000000000000206 R12: 00000000000=
00004
[   15.573160] R13: 00007ffe5c544e30 R14: 0000000000000000 R15: 00000000000=
00000
[   15.574720] Code: 7b ff 43 78 0f 88 a5 6f 14 00 31 f6 48 89 df e8 ad 33 =
fb ff 48 89 df e8 55 94 ff ff 85 c0 0f 84 84 00 00 00 4c 8b a3 d8 04 00 00 =
<41> ff 44 24 04 0f 88 7f 6f 14 00 48 8b 43 58 f6 c4 01 74 58 48 =

[   15.578679] RIP: llc_ui_release+0x3a/0xd0 RSP: ffffc9000015bd70
[   15.579874] CR2: 0000000000000004
[   15.580553] ---[ end trace 0dd8fdc6b7182234 ]---
[   15.581491] Kernel panic - not syncing: Fatal exception

                                                          # HH:MM RESULT GO=
OD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
git bisect start b309e20d9dc7223f34a55a1a5e573a9b69da3783 60cc43fc888428bb2=
f18f08997432d426a243338 --
git bisect  bad 74f5796964d2f308c4f065084c2d805101782b2a  # 09:08  B      0=
    11   26   0  Merge 'stm32/stm32-next' into devel-catchup-201805030716
git bisect  bad da0bab875e8538bd9db5761ec03e431f83fb0019  # 09:16  B      0=
    11   26   0  Merge 'sailus-media/for-4.18-3' into devel-catchup-2018050=
30716
git bisect  bad ae6b372217655a323c42fddd040be9c27f22dfc3  # 09:26  B      0=
     2   17   0  Merge 'pinctrl/for-next' into devel-catchup-201805030716
git bisect good 7d12e09a3344e90e00c6a8258cc8c64d4a277daa  # 09:42  G     11=
     0    0   0  0day base guard for 'devel-catchup-201805030716'
git bisect  bad 23bd6b85a69b1067ebe776b655424eec21932afe  # 09:54  B      0=
     7   21   0  Merge 'linux-review/Roman-Gushchin/mm-introduce-memory-min=
/20180503-064145' into devel-catchup-201805030716
git bisect  bad aacc1db1cf5776722a20162c7a33b05ebe68ca89  # 10:01  B      0=
    11   25   0  prctl: don't compile some of prctl functions when CRUI dis=
abled
git bisect  bad 0e6521e40b9f94fea176cee6038b63e3c7c687d1  # 10:11  B      0=
     6   20   0  block: restore /proc/partitions to not display non-partiti=
onable removable devices
git bisect  bad 4edeafbad56d4b28e9e7e50c6ccd744c139597fc  # 10:21  B      0=
     5   19   0  fs, elf: don't complain MAP_FIXED_NOREPLACE unless -EEXIST=
 error
git bisect  bad f138cdd1d1c3aca9a49cf341bcfacc994deecd00  # 10:43  B      0=
    11   25   0  mm: enable thp migration for shmem thp
git bisect  bad e72831147e882465861aae379241e116ddc01f2c  # 10:52  B      0=
    11   25   0  fork: unconditionally clear stack on fork
git bisect  bad 059df5489edd250efd0048c95c2b9be42459818f  # 11:03  B      0=
    11   25   0  I need old gcc
git bisect  bad 486ad79630d0ba0b7205a8db9fe15ba392f5ee32  # 11:13  B      0=
    11   25   0  origin
# first bad commit: [486ad79630d0ba0b7205a8db9fe15ba392f5ee32] origin
git bisect good 60cc43fc888428bb2f18f08997432d426a243338  # 11:16  G     31=
     0    0   0  Linux 4.17-rc1
# extra tests with debug options
git bisect  bad 486ad79630d0ba0b7205a8db9fe15ba392f5ee32  # 11:28  B      0=
    11   25   0  origin
# extra tests on HEAD of linux-devel/devel-catchup-201805030716
git bisect  bad b309e20d9dc7223f34a55a1a5e573a9b69da3783  # 11:28  B      0=
    13   31   0  0day head guard for 'devel-catchup-201805030716'
# extra tests on tree/branch mmotm/master
git bisect  bad 37ee4b887928911dc6d2dd39a869330511068919  # 11:47  B      0=
     9   23   0  pci: test for unexpectedly disabled bridges

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/lkp                          Intel Corporati=
on

--===============3659209874511249718==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="2.gz"

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
--===============3659209874511249718==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="4.17.0-rc1-00001-g486ad792"

IyEvYmluL2Jhc2gKCmtlcm5lbD0kMQppbml0cmQ9cXVhbnRhbC1jb3JlLXg4Nl82NC5jZ3oKCndn
ZXQgLS1uby1jbG9iYmVyIGh0dHBzOi8vZ2l0aHViLmNvbS9mZW5nZ3VhbmcvcmVwcm9kdWNlLWtl
cm5lbC1idWcvcmF3L21hc3Rlci9xdWFudGFsLyRpbml0cmQKCmt2bT0oCglxZW11LXN5c3RlbS14
ODZfNjQKCS1lbmFibGUta3ZtCgktY3B1IGt2bTY0Cgkta2VybmVsICRrZXJuZWwKCS1pbml0cmQg
JGluaXRyZAoJLW0gNTEyCgktc21wIDIKCS1kZXZpY2UgZTEwMDAsbmV0ZGV2PW5ldDAKCS1uZXRk
ZXYgdXNlcixpZD1uZXQwCgktYm9vdCBvcmRlcj1uYwoJLW5vLXJlYm9vdAoJLXdhdGNoZG9nIGk2
MzAwZXNiCgktd2F0Y2hkb2ctYWN0aW9uIGRlYnVnCgktcnRjIGJhc2U9bG9jYWx0aW1lCgktc2Vy
aWFsIHN0ZGlvCgktZGlzcGxheSBub25lCgktbW9uaXRvciBudWxsCikKCmFwcGVuZD0oCglyb290
PS9kZXYvcmFtMAoJaHVuZ190YXNrX3BhbmljPTEKCWRlYnVnCglhcGljPWRlYnVnCglzeXNycV9h
bHdheXNfZW5hYmxlZAoJcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAoJbmV0Lmlm
bmFtZXM9MAoJcHJpbnRrLmRldmttc2c9b24KCXBhbmljPS0xCglzb2Z0bG9ja3VwX3BhbmljPTEK
CW5taV93YXRjaGRvZz1wYW5pYwoJb29wcz1wYW5pYwoJbG9hZF9yYW1kaXNrPTIKCXByb21wdF9y
YW1kaXNrPTAKCWRyYmQubWlub3JfY291bnQ9OAoJc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCglpZ25v
cmVfbG9nbGV2ZWwKCWNvbnNvbGU9dHR5MAoJZWFybHlwcmludGs9dHR5UzAsMTE1MjAwCgljb25z
b2xlPXR0eVMwLDExNTIwMAoJdmdhPW5vcm1hbAoJcncKCWRyYmQubWlub3JfY291bnQ9OAoJcmN1
cGVyZi5zaHV0ZG93bj0wCikKCiIke2t2bVtAXX0iIC1hcHBlbmQgIiR7YXBwZW5kWypdfSIK

--===============3659209874511249718==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config-4.17.0-rc1-00001-g486ad79"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3g4
Nl82NCA0LjE3LjAtcmMxIEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHXzY0QklUPXkKQ09O
RklHX1g4Nl82ND15CkNPTkZJR19YODY9eQpDT05GSUdfSU5TVFJVQ1RJT05fREVDT0RFUj15CkNP
TkZJR19PVVRQVVRfRk9STUFUPSJlbGY2NC14ODYtNjQiCkNPTkZJR19BUkNIX0RFRkNPTkZJRz0i
YXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVmY29uZmlnIgpDT05GSUdfTE9DS0RFUF9TVVBQT1JU
PXkKQ09ORklHX1NUQUNLVFJBQ0VfU1VQUE9SVD15CkNPTkZJR19NTVU9eQpDT05GSUdfQVJDSF9N
TUFQX1JORF9CSVRTX01JTj0yOApDT05GSUdfQVJDSF9NTUFQX1JORF9CSVRTX01BWD0zMgpDT05G
SUdfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NSU49OApDT05GSUdfQVJDSF9NTUFQX1JORF9D
T01QQVRfQklUU19NQVg9MTYKQ09ORklHX05FRURfRE1BX01BUF9TVEFURT15CkNPTkZJR19ORUVE
X1NHX0RNQV9MRU5HVEg9eQpDT05GSUdfR0VORVJJQ19CVUc9eQpDT05GSUdfR0VORVJJQ19CVUdf
UkVMQVRJVkVfUE9JTlRFUlM9eQpDT05GSUdfR0VORVJJQ19IV0VJR0hUPXkKQ09ORklHX1JXU0VN
X1hDSEdBRERfQUxHT1JJVEhNPXkKQ09ORklHX0dFTkVSSUNfQ0FMSUJSQVRFX0RFTEFZPXkKQ09O
RklHX0FSQ0hfSEFTX0NQVV9SRUxBWD15CkNPTkZJR19BUkNIX0hBU19DQUNIRV9MSU5FX1NJWkU9
eQpDT05GSUdfSEFWRV9TRVRVUF9QRVJfQ1BVX0FSRUE9eQpDT05GSUdfTkVFRF9QRVJfQ1BVX0VN
QkVEX0ZJUlNUX0NIVU5LPXkKQ09ORklHX05FRURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LPXkK
Q09ORklHX0FSQ0hfSElCRVJOQVRJT05fUE9TU0lCTEU9eQpDT05GSUdfQVJDSF9TVVNQRU5EX1BP
U1NJQkxFPXkKQ09ORklHX0FSQ0hfV0FOVF9IVUdFX1BNRF9TSEFSRT15CkNPTkZJR19BUkNIX1dB
TlRfR0VORVJBTF9IVUdFVExCPXkKQ09ORklHX1pPTkVfRE1BMzI9eQpDT05GSUdfQVVESVRfQVJD
SD15CkNPTkZJR19BUkNIX1NVUFBPUlRTX09QVElNSVpFRF9JTkxJTklORz15CkNPTkZJR19BUkNI
X1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX1VQUk9CRVM9
eQpDT05GSUdfRklYX0VBUkxZQ09OX01FTT15CkNPTkZJR19QR1RBQkxFX0xFVkVMUz00CkNPTkZJ
R19JUlFfV09SSz15CkNPTkZJR19CVUlMRFRJTUVfRVhUQUJMRV9TT1JUPXkKQ09ORklHX1RIUkVB
RF9JTkZPX0lOX1RBU0s9eQoKIwojIEdlbmVyYWwgc2V0dXAKIwpDT05GSUdfQlJPS0VOX09OX1NN
UD15CkNPTkZJR19JTklUX0VOVl9BUkdfTElNSVQ9MzIKQ09ORklHX0NST1NTX0NPTVBJTEU9IiIK
IyBDT05GSUdfQ09NUElMRV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0xPQ0FMVkVSU0lPTj0iIgpD
T05GSUdfTE9DQUxWRVJTSU9OX0FVVE89eQpDT05GSUdfSEFWRV9LRVJORUxfR1pJUD15CkNPTkZJ
R19IQVZFX0tFUk5FTF9CWklQMj15CkNPTkZJR19IQVZFX0tFUk5FTF9MWk1BPXkKQ09ORklHX0hB
VkVfS0VSTkVMX1haPXkKQ09ORklHX0hBVkVfS0VSTkVMX0xaTz15CkNPTkZJR19IQVZFX0tFUk5F
TF9MWjQ9eQojIENPTkZJR19LRVJORUxfR1pJUCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9C
WklQMiBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9MWk1BIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VSTkVMX1haIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaTyBpcyBub3Qgc2V0CkNPTkZJ
R19LRVJORUxfTFo0PXkKQ09ORklHX0RFRkFVTFRfSE9TVE5BTUU9Iihub25lKSIKQ09ORklHX1NZ
U1ZJUEM9eQpDT05GSUdfU1lTVklQQ19TWVNDVEw9eQojIENPTkZJR19QT1NJWF9NUVVFVUUgaXMg
bm90IHNldApDT05GSUdfQ1JPU1NfTUVNT1JZX0FUVEFDSD15CiMgQ09ORklHX1VTRUxJQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FVRElUIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9BVURJVFNZ
U0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19JUlFfUFJPQkU9eQpD
T05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNPTkZJR19HRU5FUklDX0lSUV9DSElQPXkKQ09ORklH
X0lSUV9ET01BSU49eQpDT05GSUdfSVJRX1NJTT15CkNPTkZJR19JUlFfRE9NQUlOX0hJRVJBUkNI
WT15CkNPTkZJR19HRU5FUklDX0lSUV9NQVRSSVhfQUxMT0NBVE9SPXkKQ09ORklHX0dFTkVSSUNf
SVJRX1JFU0VSVkFUSU9OX01PREU9eQpDT05GSUdfSVJRX0ZPUkNFRF9USFJFQURJTkc9eQpDT05G
SUdfU1BBUlNFX0lSUT15CiMgQ09ORklHX0dFTkVSSUNfSVJRX0RFQlVHRlMgaXMgbm90IHNldApD
T05GSUdfQ0xPQ0tTT1VSQ0VfV0FUQ0hET0c9eQpDT05GSUdfQVJDSF9DTE9DS1NPVVJDRV9EQVRB
PXkKQ09ORklHX0NMT0NLU09VUkNFX1ZBTElEQVRFX0xBU1RfQ1lDTEU9eQpDT05GSUdfR0VORVJJ
Q19USU1FX1ZTWVNDQUxMPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFM9eQpDT05GSUdfR0VO
RVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1Q9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19N
SU5fQURKVVNUPXkKQ09ORklHX0dFTkVSSUNfQ01PU19VUERBVEU9eQoKIwojIFRpbWVycyBzdWJz
eXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9UPXkKQ09ORklHX05PX0haX0NPTU1PTj15CiMgQ09O
RklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQKQ09ORklHX05PX0haX0lETEU9eQpDT05GSUdfTk9f
SFo9eQojIENPTkZJR19ISUdIX1JFU19USU1FUlMgaXMgbm90IHNldAoKIwojIENQVS9UYXNrIHRp
bWUgYW5kIHN0YXRzIGFjY291bnRpbmcKIwpDT05GSUdfVElDS19DUFVfQUNDT1VOVElORz15CiMg
Q09ORklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJRX1RJ
TUVfQUNDT1VOVElORyBpcyBub3Qgc2V0CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUPXkKQ09ORklH
X0JTRF9QUk9DRVNTX0FDQ1RfVjM9eQpDT05GSUdfVEFTS1NUQVRTPXkKQ09ORklHX1RBU0tfREVM
QVlfQUNDVD15CiMgQ09ORklHX1RBU0tfWEFDQ1QgaXMgbm90IHNldAoKIwojIFJDVSBTdWJzeXN0
ZW0KIwpDT05GSUdfVElOWV9SQ1U9eQpDT05GSUdfUkNVX0VYUEVSVD15CkNPTkZJR19TUkNVPXkK
Q09ORklHX1RJTllfU1JDVT15CkNPTkZJR19UQVNLU19SQ1U9eQpDT05GSUdfQlVJTERfQklOMkM9
eQpDT05GSUdfSUtDT05GSUc9eQpDT05GSUdfSUtDT05GSUdfUFJPQz15CkNPTkZJR19MT0dfQlVG
X1NISUZUPTIwCkNPTkZJR19QUklOVEtfU0FGRV9MT0dfQlVGX1NISUZUPTEzCkNPTkZJR19IQVZF
X1VOU1RBQkxFX1NDSEVEX0NMT0NLPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTlVNQV9CQUxBTkNJ
Tkc9eQpDT05GSUdfQVJDSF9XQU5UX0JBVENIRURfVU5NQVBfVExCX0ZMVVNIPXkKQ09ORklHX0FS
Q0hfU1VQUE9SVFNfSU5UMTI4PXkKQ09ORklHX0NHUk9VUFM9eQpDT05GSUdfUEFHRV9DT1VOVEVS
PXkKQ09ORklHX01FTUNHPXkKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19GQUlSX0dST1VQ
X1NDSEVEPXkKQ09ORklHX0NGU19CQU5EV0lEVEg9eQojIENPTkZJR19SVF9HUk9VUF9TQ0hFRCBp
cyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfUElEUz15CkNPTkZJR19DR1JPVVBfUkRNQT15CiMgQ09O
RklHX0NHUk9VUF9GUkVFWkVSIGlzIG5vdCBzZXQKQ09ORklHX0NHUk9VUF9ERVZJQ0U9eQojIENP
TkZJR19DR1JPVVBfQ1BVQUNDVCBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfUEVSRj15CiMgQ09O
RklHX0NHUk9VUF9CUEYgaXMgbm90IHNldAojIENPTkZJR19DR1JPVVBfREVCVUcgaXMgbm90IHNl
dApDT05GSUdfU09DS19DR1JPVVBfREFUQT15CiMgQ09ORklHX05BTUVTUEFDRVMgaXMgbm90IHNl
dApDT05GSUdfU0NIRURfQVVUT0dST1VQPXkKIyBDT05GSUdfU1lTRlNfREVQUkVDQVRFRCBpcyBu
b3Qgc2V0CkNPTkZJR19SRUxBWT15CkNPTkZJR19CTEtfREVWX0lOSVRSRD15CkNPTkZJR19JTklU
UkFNRlNfU09VUkNFPSIiCkNPTkZJR19SRF9HWklQPXkKIyBDT05GSUdfUkRfQlpJUDIgaXMgbm90
IHNldAojIENPTkZJR19SRF9MWk1BIGlzIG5vdCBzZXQKQ09ORklHX1JEX1haPXkKQ09ORklHX1JE
X0xaTz15CiMgQ09ORklHX1JEX0xaNCBpcyBub3Qgc2V0CkNPTkZJR19DQ19PUFRJTUlaRV9GT1Jf
UEVSRk9STUFOQ0U9eQojIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBpcyBub3Qgc2V0CkNP
TkZJR19TWVNDVEw9eQpDT05GSUdfQU5PTl9JTk9ERVM9eQpDT05GSUdfU1lTQ1RMX0VYQ0VQVElP
Tl9UUkFDRT15CkNPTkZJR19IQVZFX1BDU1BLUl9QTEFURk9STT15CkNPTkZJR19CUEY9eQpDT05G
SUdfRVhQRVJUPXkKQ09ORklHX01VTFRJVVNFUj15CiMgQ09ORklHX1NHRVRNQVNLX1NZU0NBTEwg
aXMgbm90IHNldAojIENPTkZJR19TWVNGU19TWVNDQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lT
Q1RMX1NZU0NBTEwgaXMgbm90IHNldApDT05GSUdfRkhBTkRMRT15CiMgQ09ORklHX1BPU0lYX1RJ
TUVSUyBpcyBub3Qgc2V0CkNPTkZJR19QUklOVEs9eQpDT05GSUdfUFJJTlRLX05NST15CkNPTkZJ
R19CVUc9eQpDT05GSUdfRUxGX0NPUkU9eQpDT05GSUdfUENTUEtSX1BMQVRGT1JNPXkKIyBDT05G
SUdfQkFTRV9GVUxMIGlzIG5vdCBzZXQKQ09ORklHX0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkK
Q09ORklHX0VQT0xMPXkKQ09ORklHX1NJR05BTEZEPXkKQ09ORklHX1RJTUVSRkQ9eQpDT05GSUdf
RVZFTlRGRD15CkNPTkZJR19TSE1FTT15CiMgQ09ORklHX0FJTyBpcyBub3Qgc2V0CkNPTkZJR19B
RFZJU0VfU1lTQ0FMTFM9eQojIENPTkZJR19NRU1CQVJSSUVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0hFQ0tQT0lOVF9SRVNUT1JFIGlzIG5vdCBzZXQKQ09ORklHX0tBTExTWU1TPXkKQ09ORklHX0tB
TExTWU1TX0FMTD15CkNPTkZJR19LQUxMU1lNU19CQVNFX1JFTEFUSVZFPXkKQ09ORklHX0JQRl9T
WVNDQUxMPXkKQ09ORklHX0JQRl9KSVRfQUxXQVlTX09OPXkKIyBDT05GSUdfVVNFUkZBVUxURkQg
aXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfTUVNQkFSUklFUl9TWU5DX0NPUkU9eQpDT05GSUdf
RU1CRURERUQ9eQpDT05GSUdfSEFWRV9QRVJGX0VWRU5UUz15CkNPTkZJR19QQzEwND15CgojCiMg
S2VybmVsIFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKIwpDT05GSUdfUEVSRl9FVkVO
VFM9eQojIENPTkZJR19ERUJVR19QRVJGX1VTRV9WTUFMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1ZN
X0VWRU5UX0NPVU5URVJTPXkKIyBDT05GSUdfQ09NUEFUX0JSSyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NMQUIgaXMgbm90IHNldAojIENPTkZJR19TTFVCIGlzIG5vdCBzZXQKQ09ORklHX1NMT0I9eQpD
T05GSUdfU0xBQl9NRVJHRV9ERUZBVUxUPXkKQ09ORklHX1BST0ZJTElORz15CkNPTkZJR19DUkFT
SF9DT1JFPXkKQ09ORklHX0tFWEVDX0NPUkU9eQojIENPTkZJR19PUFJPRklMRSBpcyBub3Qgc2V0
CkNPTkZJR19IQVZFX09QUk9GSUxFPXkKQ09ORklHX09QUk9GSUxFX05NSV9USU1FUj15CiMgQ09O
RklHX0tQUk9CRVMgaXMgbm90IHNldApDT05GSUdfSlVNUF9MQUJFTD15CkNPTkZJR19TVEFUSUNf
S0VZU19TRUxGVEVTVD15CkNPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkK
Q09ORklHX0FSQ0hfVVNFX0JVSUxUSU5fQlNXQVA9eQpDT05GSUdfSEFWRV9JT1JFTUFQX1BST1Q9
eQpDT05GSUdfSEFWRV9LUFJPQkVTPXkKQ09ORklHX0hBVkVfS1JFVFBST0JFUz15CkNPTkZJR19I
QVZFX09QVFBST0JFUz15CkNPTkZJR19IQVZFX0tQUk9CRVNfT05fRlRSQUNFPXkKQ09ORklHX0hB
VkVfRlVOQ1RJT05fRVJST1JfSU5KRUNUSU9OPXkKQ09ORklHX0hBVkVfTk1JPXkKQ09ORklHX0hB
VkVfQVJDSF9UUkFDRUhPT0s9eQpDT05GSUdfSEFWRV9ETUFfQ09OVElHVU9VUz15CkNPTkZJR19H
RU5FUklDX1NNUF9JRExFX1RIUkVBRD15CkNPTkZJR19BUkNIX0hBU19GT1JUSUZZX1NPVVJDRT15
CkNPTkZJR19BUkNIX0hBU19TRVRfTUVNT1JZPXkKQ09ORklHX0hBVkVfQVJDSF9USFJFQURfU1RS
VUNUX1dISVRFTElTVD15CkNPTkZJR19BUkNIX1dBTlRTX0RZTkFNSUNfVEFTS19TVFJVQ1Q9eQpD
T05GSUdfSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NFU1NfQVBJPXkKQ09ORklHX0hBVkVfQ0xLPXkK
Q09ORklHX0hBVkVfRE1BX0FQSV9ERUJVRz15CkNPTkZJR19IQVZFX0hXX0JSRUFLUE9JTlQ9eQpD
T05GSUdfSEFWRV9NSVhFRF9CUkVBS1BPSU5UU19SRUdTPXkKQ09ORklHX0hBVkVfVVNFUl9SRVRV
Uk5fTk9USUZJRVI9eQpDT05GSUdfSEFWRV9QRVJGX0VWRU5UU19OTUk9eQpDT05GSUdfSEFWRV9I
QVJETE9DS1VQX0RFVEVDVE9SX1BFUkY9eQpDT05GSUdfSEFWRV9QRVJGX1JFR1M9eQpDT05GSUdf
SEFWRV9QRVJGX1VTRVJfU1RBQ0tfRFVNUD15CkNPTkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15
CkNPTkZJR19IQVZFX1JDVV9UQUJMRV9GUkVFPXkKQ09ORklHX0FSQ0hfSEFWRV9OTUlfU0FGRV9D
TVBYQ0hHPXkKQ09ORklHX0hBVkVfQ01QWENIR19MT0NBTD15CkNPTkZJR19IQVZFX0NNUFhDSEdf
RE9VQkxFPXkKQ09ORklHX0hBVkVfQVJDSF9TRUNDT01QX0ZJTFRFUj15CkNPTkZJR19TRUNDT01Q
X0ZJTFRFUj15CkNPTkZJR19IQVZFX0dDQ19QTFVHSU5TPXkKIyBDT05GSUdfR0NDX1BMVUdJTlMg
aXMgbm90IHNldApDT05GSUdfSEFWRV9DQ19TVEFDS1BST1RFQ1RPUj15CiMgQ09ORklHX0NDX1NU
QUNLUFJPVEVDVE9SX05PTkUgaXMgbm90IHNldApDT05GSUdfQ0NfU1RBQ0tQUk9URUNUT1JfUkVH
VUxBUj15CiMgQ09ORklHX0NDX1NUQUNLUFJPVEVDVE9SX1NUUk9ORyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NDX1NUQUNLUFJPVEVDVE9SX0FVVE8gaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX1dJ
VEhJTl9TVEFDS19GUkFNRVM9eQpDT05GSUdfSEFWRV9DT05URVhUX1RSQUNLSU5HPXkKQ09ORklH
X0hBVkVfVklSVF9DUFVfQUNDT1VOVElOR19HRU49eQpDT05GSUdfSEFWRV9JUlFfVElNRV9BQ0NP
VU5USU5HPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRT15CkNPTkZJR19I
QVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVEPXkKQ09ORklHX0hBVkVfQVJDSF9IVUdF
X1ZNQVA9eQpDT05GSUdfSEFWRV9BUkNIX1NPRlRfRElSVFk9eQpDT05GSUdfSEFWRV9NT0RfQVJD
SF9TUEVDSUZJQz15CkNPTkZJR19NT0RVTEVTX1VTRV9FTEZfUkVMQT15CkNPTkZJR19IQVZFX0lS
UV9FWElUX09OX0lSUV9TVEFDSz15CkNPTkZJR19BUkNIX0hBU19FTEZfUkFORE9NSVpFPXkKQ09O
RklHX0hBVkVfQVJDSF9NTUFQX1JORF9CSVRTPXkKQ09ORklHX0hBVkVfRVhJVF9USFJFQUQ9eQpD
T05GSUdfQVJDSF9NTUFQX1JORF9CSVRTPTI4CkNPTkZJR19IQVZFX0NPUFlfVEhSRUFEX1RMUz15
CkNPTkZJR19IQVZFX1NUQUNLX1ZBTElEQVRJT049eQpDT05GSUdfSEFWRV9SRUxJQUJMRV9TVEFD
S1RSQUNFPXkKQ09ORklHX0lTQV9CVVNfQVBJPXkKQ09ORklHX0hBVkVfQVJDSF9WTUFQX1NUQUNL
PXkKQ09ORklHX1ZNQVBfU1RBQ0s9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX0tFUk5FTF9SV1g9
eQpDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVM
RV9SV1g9eQpDT05GSUdfU1RSSUNUX01PRFVMRV9SV1g9eQpDT05GSUdfQVJDSF9IQVNfUkVGQ09V
TlQ9eQojIENPTkZJR19SRUZDT1VOVF9GVUxMIGlzIG5vdCBzZXQKCiMKIyBHQ09WLWJhc2VkIGtl
cm5lbCBwcm9maWxpbmcKIwojIENPTkZJR19HQ09WX0tFUk5FTCBpcyBub3Qgc2V0CkNPTkZJR19B
UkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMPXkKQ09ORklHX1JUX01VVEVYRVM9eQpDT05GSUdfQkFT
RV9TTUFMTD0xCkNPTkZJR19NT0RVTEVTPXkKQ09ORklHX01PRFVMRV9GT1JDRV9MT0FEPXkKIyBD
T05GSUdfTU9EVUxFX1VOTE9BRCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFZFUlNJT05TIGlzIG5v
dCBzZXQKIyBDT05GSUdfTU9EVUxFX1NSQ1ZFUlNJT05fQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdf
TU9EVUxFX1NJRyBpcyBub3Qgc2V0CkNPTkZJR19NT0RVTEVfQ09NUFJFU1M9eQpDT05GSUdfTU9E
VUxFX0NPTVBSRVNTX0daSVA9eQojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfWFogaXMgbm90IHNl
dApDT05GSUdfTU9EVUxFU19UUkVFX0xPT0tVUD15CiMgQ09ORklHX0JMT0NLIGlzIG5vdCBzZXQK
Q09ORklHX0FTTjE9eQpDT05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9eQpDT05GSUdfQVJDSF9T
VVBQT1JUU19BVE9NSUNfUk1XPXkKQ09ORklHX0FSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1M9eQpD
T05GSUdfQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfQVJDSF9IQVNfU1lOQ19DT1JF
X0JFRk9SRV9VU0VSTU9ERT15CkNPTkZJR19BUkNIX0hBU19TWVNDQUxMX1dSQVBQRVI9eQoKIwoj
IFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwojCiMgQ09ORklHX1pPTkVfRE1BIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU01QIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9GRUFUVVJFX05BTUVTPXkKIyBD
T05GSUdfWDg2X1gyQVBJQyBpcyBub3Qgc2V0CkNPTkZJR19YODZfTVBQQVJTRT15CiMgQ09ORklH
X0dPTERGSVNIIGlzIG5vdCBzZXQKQ09ORklHX1JFVFBPTElORT15CiMgQ09ORklHX0lOVEVMX1JE
VCBpcyBub3Qgc2V0CkNPTkZJR19YODZfRVhURU5ERURfUExBVEZPUk09eQojIENPTkZJR19YODZf
R09MREZJU0ggaXMgbm90IHNldAojIENPTkZJR19YODZfSU5URUxfTFBTUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1g4Nl9BTURfUExBVEZPUk1fREVWSUNFIGlzIG5vdCBzZXQKQ09ORklHX0lPU0ZfTUJJ
PW0KQ09ORklHX0lPU0ZfTUJJX0RFQlVHPXkKIyBDT05GSUdfU0NIRURfT01JVF9GUkFNRV9QT0lO
VEVSIGlzIG5vdCBzZXQKQ09ORklHX0hZUEVSVklTT1JfR1VFU1Q9eQpDT05GSUdfUEFSQVZJUlQ9
eQojIENPTkZJR19QQVJBVklSVF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1hFTiBpcyBub3Qg
c2V0CkNPTkZJR19LVk1fR1VFU1Q9eQojIENPTkZJR19LVk1fREVCVUdfRlMgaXMgbm90IHNldAoj
IENPTkZJR19QQVJBVklSVF9USU1FX0FDQ09VTlRJTkcgaXMgbm90IHNldApDT05GSUdfUEFSQVZJ
UlRfQ0xPQ0s9eQojIENPTkZJR19KQUlMSE9VU0VfR1VFU1QgaXMgbm90IHNldApDT05GSUdfTk9f
Qk9PVE1FTT15CiMgQ09ORklHX01LOCBpcyBub3Qgc2V0CiMgQ09ORklHX01QU0MgaXMgbm90IHNl
dAojIENPTkZJR19NQ09SRTIgaXMgbm90IHNldAojIENPTkZJR19NQVRPTSBpcyBub3Qgc2V0CkNP
TkZJR19HRU5FUklDX0NQVT15CkNPTkZJR19YODZfSU5URVJOT0RFX0NBQ0hFX1NISUZUPTYKQ09O
RklHX1g4Nl9MMV9DQUNIRV9TSElGVD02CkNPTkZJR19YODZfVFNDPXkKQ09ORklHX1g4Nl9DTVBY
Q0hHNjQ9eQpDT05GSUdfWDg2X0NNT1Y9eQpDT05GSUdfWDg2X01JTklNVU1fQ1BVX0ZBTUlMWT02
NApDT05GSUdfWDg2X0RFQlVHQ1RMTVNSPXkKIyBDT05GSUdfUFJPQ0VTU09SX1NFTEVDVCBpcyBu
b3Qgc2V0CkNPTkZJR19DUFVfU1VQX0lOVEVMPXkKQ09ORklHX0NQVV9TVVBfQU1EPXkKQ09ORklH
X0NQVV9TVVBfQ0VOVEFVUj15CkNPTkZJR19IUEVUX1RJTUVSPXkKQ09ORklHX0hQRVRfRU1VTEFU
RV9SVEM9eQojIENPTkZJR19ETUkgaXMgbm90IHNldAojIENPTkZJR19HQVJUX0lPTU1VIGlzIG5v
dCBzZXQKQ09ORklHX0NBTEdBUllfSU9NTVU9eQpDT05GSUdfQ0FMR0FSWV9JT01NVV9FTkFCTEVE
X0JZX0RFRkFVTFQ9eQpDT05GSUdfU1dJT1RMQj15CkNPTkZJR19JT01NVV9IRUxQRVI9eQpDT05G
SUdfTlJfQ1BVU19SQU5HRV9CRUdJTj0xCkNPTkZJR19OUl9DUFVTX1JBTkdFX0VORD0xCkNPTkZJ
R19OUl9DUFVTX0RFRkFVTFQ9MQpDT05GSUdfTlJfQ1BVUz0xCkNPTkZJR19QUkVFTVBUX05PTkU9
eQojIENPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFQg
aXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9DT1VOVD15CkNPTkZJR19VUF9MQVRFX0lOSVQ9eQpD
T05GSUdfWDg2X0xPQ0FMX0FQSUM9eQpDT05GSUdfWDg2X0lPX0FQSUM9eQojIENPTkZJR19YODZf
UkVST1VURV9GT1JfQlJPS0VOX0JPT1RfSVJRUyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9NQ0Ug
aXMgbm90IHNldAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3JpbmcKIwojIENPTkZJR19QRVJGX0VW
RU5UU19JTlRFTF9VTkNPUkUgaXMgbm90IHNldApDT05GSUdfUEVSRl9FVkVOVFNfSU5URUxfUkFQ
TD15CiMgQ09ORklHX1BFUkZfRVZFTlRTX0lOVEVMX0NTVEFURSBpcyBub3Qgc2V0CkNPTkZJR19Q
RVJGX0VWRU5UU19BTURfUE9XRVI9eQpDT05GSUdfWDg2X1ZTWVNDQUxMX0VNVUxBVElPTj15CkNP
TkZJR19JOEs9eQpDT05GSUdfTUlDUk9DT0RFPXkKIyBDT05GSUdfTUlDUk9DT0RFX0lOVEVMIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUlDUk9DT0RFX0FNRCBpcyBub3Qgc2V0CkNPTkZJR19NSUNST0NP
REVfT0xEX0lOVEVSRkFDRT15CkNPTkZJR19YODZfTVNSPXkKIyBDT05GSUdfWDg2X0NQVUlEIGlz
IG5vdCBzZXQKIyBDT05GSUdfWDg2XzVMRVZFTCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1BIWVNf
QUREUl9UXzY0QklUPXkKQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVD15CkNPTkZJR19YODZf
RElSRUNUX0dCUEFHRVM9eQpDT05GSUdfQVJDSF9IQVNfTUVNX0VOQ1JZUFQ9eQojIENPTkZJR19B
TURfTUVNX0VOQ1JZUFQgaXMgbm90IHNldApDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxFPXkK
Q09ORklHX0FSQ0hfU1BBUlNFTUVNX0RFRkFVTFQ9eQpDT05GSUdfQVJDSF9TRUxFQ1RfTUVNT1JZ
X01PREVMPXkKQ09ORklHX0lMTEVHQUxfUE9JTlRFUl9WQUxVRT0weGRlYWQwMDAwMDAwMDAwMDAK
Q09ORklHX1NFTEVDVF9NRU1PUllfTU9ERUw9eQpDT05GSUdfU1BBUlNFTUVNX01BTlVBTD15CkNP
TkZJR19TUEFSU0VNRU09eQpDT05GSUdfSEFWRV9NRU1PUllfUFJFU0VOVD15CkNPTkZJR19TUEFS
U0VNRU1fRVhUUkVNRT15CkNPTkZJR19TUEFSU0VNRU1fVk1FTU1BUF9FTkFCTEU9eQpDT05GSUdf
U1BBUlNFTUVNX0FMTE9DX01FTV9NQVBfVE9HRVRIRVI9eQojIENPTkZJR19TUEFSU0VNRU1fVk1F
TU1BUCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX01FTUJMT0NLPXkKQ09ORklHX0hBVkVfTUVNQkxP
Q0tfTk9ERV9NQVA9eQpDT05GSUdfSEFWRV9HRU5FUklDX0dVUD15CkNPTkZJR19BUkNIX0RJU0NB
UkRfTUVNQkxPQ0s9eQpDT05GSUdfTUVNT1JZX0lTT0xBVElPTj15CiMgQ09ORklHX01FTU9SWV9I
T1RQTFVHIGlzIG5vdCBzZXQKQ09ORklHX1NQTElUX1BUTE9DS19DUFVTPTQKQ09ORklHX0FSQ0hf
RU5BQkxFX1NQTElUX1BNRF9QVExPQ0s9eQpDT05GSUdfQ09NUEFDVElPTj15CkNPTkZJR19NSUdS
QVRJT049eQpDT05GSUdfQVJDSF9FTkFCTEVfVEhQX01JR1JBVElPTj15CkNPTkZJR19QSFlTX0FE
RFJfVF82NEJJVD15CkNPTkZJR19WSVJUX1RPX0JVUz15CkNPTkZJR19LU009eQpDT05GSUdfREVG
QVVMVF9NTUFQX01JTl9BRERSPTQwOTYKQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFPXkKQ09O
RklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFX0FMV0FZUz15CiMgQ09ORklHX1RSQU5TUEFSRU5UX0hV
R0VQQUdFX01BRFZJU0UgaXMgbm90IHNldApDT05GSUdfQVJDSF9XQU5UU19USFBfU1dBUD15CkNP
TkZJR19USFBfU1dBUD15CkNPTkZJR19UUkFOU1BBUkVOVF9IVUdFX1BBR0VDQUNIRT15CkNPTkZJ
R19ORUVEX1BFUl9DUFVfS009eQpDT05GSUdfQ0xFQU5DQUNIRT15CkNPTkZJR19DTUE9eQpDT05G
SUdfQ01BX0RFQlVHPXkKQ09ORklHX0NNQV9ERUJVR0ZTPXkKQ09ORklHX0NNQV9BUkVBUz03CiMg
Q09ORklHX1pQT09MIGlzIG5vdCBzZXQKQ09ORklHX1pCVUQ9bQojIENPTkZJR19aU01BTExPQyBp
cyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0VBUkxZX0lPUkVNQVA9eQpDT05GSUdfREVGRVJSRURf
U1RSVUNUX1BBR0VfSU5JVD15CiMgQ09ORklHX0lETEVfUEFHRV9UUkFDS0lORyBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0hBU19aT05FX0RFVklDRT15CkNPTkZJR19GUkFNRV9WRUNUT1I9eQojIENP
TkZJR19QRVJDUFVfU1RBVFMgaXMgbm90IHNldApDT05GSUdfR1VQX0JFTkNITUFSSz15CkNPTkZJ
R19YODZfQ0hFQ0tfQklPU19DT1JSVVBUSU9OPXkKQ09ORklHX1g4Nl9CT09UUEFSQU1fTUVNT1JZ
X0NPUlJVUFRJT05fQ0hFQ0s9eQpDT05GSUdfWDg2X1JFU0VSVkVfTE9XPTY0CiMgQ09ORklHX01U
UlIgaXMgbm90IHNldAojIENPTkZJR19BUkNIX1JBTkRPTSBpcyBub3Qgc2V0CkNPTkZJR19YODZf
U01BUD15CkNPTkZJR19YODZfSU5URUxfVU1JUD15CiMgQ09ORklHX1g4Nl9JTlRFTF9NUFggaXMg
bm90IHNldAojIENPTkZJR19YODZfSU5URUxfTUVNT1JZX1BST1RFQ1RJT05fS0VZUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0VGSSBpcyBub3Qgc2V0CkNPTkZJR19TRUNDT01QPXkKIyBDT05GSUdfSFpf
MTAwIGlzIG5vdCBzZXQKQ09ORklHX0haXzI1MD15CiMgQ09ORklHX0haXzMwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX0haXzEwMDAgaXMgbm90IHNldApDT05GSUdfSFo9MjUwCkNPTkZJR19LRVhFQz15
CkNPTkZJR19LRVhFQ19GSUxFPXkKQ09ORklHX0FSQ0hfSEFTX0tFWEVDX1BVUkdBVE9SWT15CiMg
Q09ORklHX0tFWEVDX1ZFUklGWV9TSUcgaXMgbm90IHNldApDT05GSUdfQ1JBU0hfRFVNUD15CkNP
TkZJR19QSFlTSUNBTF9TVEFSVD0weDEwMDAwMDAKIyBDT05GSUdfUkVMT0NBVEFCTEUgaXMgbm90
IHNldApDT05GSUdfUEhZU0lDQUxfQUxJR049MHgyMDAwMDAKQ09ORklHX0xFR0FDWV9WU1lTQ0FM
TF9FTVVMQVRFPXkKIyBDT05GSUdfTEVHQUNZX1ZTWVNDQUxMX05PTkUgaXMgbm90IHNldAojIENP
TkZJR19DTURMSU5FX0JPT0wgaXMgbm90IHNldAojIENPTkZJR19NT0RJRllfTERUX1NZU0NBTEwg
aXMgbm90IHNldApDT05GSUdfSEFWRV9MSVZFUEFUQ0g9eQpDT05GSUdfQVJDSF9IQVNfQUREX1BB
R0VTPXkKQ09ORklHX0FSQ0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHPXkKCiMKIyBQb3dlciBtYW5h
Z2VtZW50IGFuZCBBQ1BJIG9wdGlvbnMKIwojIENPTkZJR19TVVNQRU5EIGlzIG5vdCBzZXQKQ09O
RklHX1BNPXkKIyBDT05GSUdfUE1fREVCVUcgaXMgbm90IHNldApDT05GSUdfUE1fQ0xLPXkKIyBD
T05GSUdfV1FfUE9XRVJfRUZGSUNJRU5UX0RFRkFVTFQgaXMgbm90IHNldApDT05GSUdfQUNQST15
CkNPTkZJR19BQ1BJX0xFR0FDWV9UQUJMRVNfTE9PS1VQPXkKQ09ORklHX0FSQ0hfTUlHSFRfSEFW
RV9BQ1BJX1BEQz15CkNPTkZJR19BQ1BJX1NZU1RFTV9QT1dFUl9TVEFURVNfU1VQUE9SVD15CiMg
Q09ORklHX0FDUElfREVCVUdHRVIgaXMgbm90IHNldApDT05GSUdfQUNQSV9TUENSX1RBQkxFPXkK
Q09ORklHX0FDUElfTFBJVD15CiMgQ09ORklHX0FDUElfUFJPQ0ZTX1BPV0VSIGlzIG5vdCBzZXQK
Q09ORklHX0FDUElfUkVWX09WRVJSSURFX1BPU1NJQkxFPXkKIyBDT05GSUdfQUNQSV9FQ19ERUJV
R0ZTIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfQUM9eQpDT05GSUdfQUNQSV9CQVRURVJZPXkKQ09O
RklHX0FDUElfQlVUVE9OPXkKIyBDT05GSUdfQUNQSV9WSURFTyBpcyBub3Qgc2V0CkNPTkZJR19B
Q1BJX0ZBTj15CiMgQ09ORklHX0FDUElfRE9DSyBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0NQVV9G
UkVRX1BTUz15CkNPTkZJR19BQ1BJX1BST0NFU1NPUl9DU1RBVEU9eQpDT05GSUdfQUNQSV9QUk9D
RVNTT1JfSURMRT15CkNPTkZJR19BQ1BJX1BST0NFU1NPUj15CiMgQ09ORklHX0FDUElfUFJPQ0VT
U09SX0FHR1JFR0FUT1IgaXMgbm90IHNldApDT05GSUdfQUNQSV9USEVSTUFMPXkKQ09ORklHX0FS
Q0hfSEFTX0FDUElfVEFCTEVfVVBHUkFERT15CkNPTkZJR19BQ1BJX1RBQkxFX1VQR1JBREU9eQoj
IENPTkZJR19BQ1BJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9QQ0lfU0xPVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FDUElfQ09OVEFJTkVSIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfSE9U
UExVR19JT0FQSUM9eQojIENPTkZJR19BQ1BJX1NCUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElf
SEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9DVVNUT01fTUVUSE9EIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkgaXMgbm90IHNldApDT05GSUdfSEFWRV9B
Q1BJX0FQRUk9eQpDT05GSUdfSEFWRV9BQ1BJX0FQRUlfTk1JPXkKIyBDT05GSUdfQUNQSV9BUEVJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFBURl9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNf
T1BSRUdJT04gaXMgbm90IHNldAojIENPTkZJR19BQ1BJX0NPTkZJR0ZTIGlzIG5vdCBzZXQKQ09O
RklHX1g4Nl9QTV9USU1FUj15CkNPTkZJR19TRkk9eQoKIwojIENQVSBGcmVxdWVuY3kgc2NhbGlu
ZwojCkNPTkZJR19DUFVfRlJFUT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQVRUUl9TRVQ9eQpDT05G
SUdfQ1BVX0ZSRVFfR09WX0NPTU1PTj15CiMgQ09ORklHX0NQVV9GUkVRX1NUQVQgaXMgbm90IHNl
dAojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QRVJGT1JNQU5DRSBpcyBub3Qgc2V0CiMg
Q09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0CkNPTkZJR19D
UFVfRlJFUV9ERUZBVUxUX0dPVl9VU0VSU1BBQ0U9eQojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxU
X0dPVl9PTkRFTUFORCBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX0NP
TlNFUlZBVElWRSBpcyBub3Qgc2V0CkNPTkZJR19DUFVfRlJFUV9HT1ZfUEVSRk9STUFOQ0U9eQpD
T05GSUdfQ1BVX0ZSRVFfR09WX1BPV0VSU0FWRT1tCkNPTkZJR19DUFVfRlJFUV9HT1ZfVVNFUlNQ
QUNFPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9PTkRFTUFORD15CiMgQ09ORklHX0NQVV9GUkVRX0dP
Vl9DT05TRVJWQVRJVkUgaXMgbm90IHNldAoKIwojIENQVSBmcmVxdWVuY3kgc2NhbGluZyBkcml2
ZXJzCiMKIyBDT05GSUdfQ1BVRlJFUV9EVCBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9JTlRFTF9Q
U1RBVEUgaXMgbm90IHNldAojIENPTkZJR19YODZfUENDX0NQVUZSRVEgaXMgbm90IHNldAojIENP
TkZJR19YODZfQUNQSV9DUFVGUkVRIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X1NQRUVEU1RFUF9D
RU5UUklOTyBpcyBub3Qgc2V0CkNPTkZJR19YODZfUDRfQ0xPQ0tNT0Q9bQoKIwojIHNoYXJlZCBv
cHRpb25zCiMKQ09ORklHX1g4Nl9TUEVFRFNURVBfTElCPW0KCiMKIyBDUFUgSWRsZQojCkNPTkZJ
R19DUFVfSURMRT15CiMgQ09ORklHX0NQVV9JRExFX0dPVl9MQURERVIgaXMgbm90IHNldApDT05G
SUdfQ1BVX0lETEVfR09WX01FTlU9eQojIENPTkZJR19JTlRFTF9JRExFIGlzIG5vdCBzZXQKCiMK
IyBCdXMgb3B0aW9ucyAoUENJIGV0Yy4pCiMKQ09ORklHX1BDST15CkNPTkZJR19QQ0lfRElSRUNU
PXkKQ09ORklHX1BDSV9NTUNPTkZJRz15CkNPTkZJR19QQ0lfRE9NQUlOUz15CkNPTkZJR19NTUNP
TkZfRkFNMTBIPXkKQ09ORklHX1BDSV9DTkIyMExFX1FVSVJLPXkKIyBDT05GSUdfUENJRVBPUlRC
VVMgaXMgbm90IHNldApDT05GSUdfUENJX0JVU19BRERSX1RfNjRCSVQ9eQojIENPTkZJR19QQ0lf
TVNJIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9RVUlSS1M9eQojIENPTkZJR19QQ0lfREVCVUcgaXMg
bm90IHNldAojIENPTkZJR19QQ0lfU1RVQiBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfQVRTPXkKQ09O
RklHX1BDSV9MT0NLTEVTU19DT05GSUc9eQojIENPTkZJR19QQ0lfSU9WIGlzIG5vdCBzZXQKIyBD
T05GSUdfUENJX1BSSSBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfUEFTSUQ9eQpDT05GSUdfUENJX0xB
QkVMPXkKQ09ORklHX0hPVFBMVUdfUENJPXkKIyBDT05GSUdfSE9UUExVR19QQ0lfQUNQSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hPVFBMVUdfUENJX0NQQ0kgaXMgbm90IHNldApDT05GSUdfSE9UUExV
R19QQ0lfU0hQQz15CgojCiMgQ2FkZW5jZSBQQ0llIGNvbnRyb2xsZXJzIHN1cHBvcnQKIwpDT05G
SUdfUENJRV9DQURFTkNFPXkKQ09ORklHX1BDSUVfQ0FERU5DRV9IT1NUPXkKCiMKIyBEZXNpZ25X
YXJlIFBDSSBDb3JlIFN1cHBvcnQKIwoKIwojIFBDSSBob3N0IGNvbnRyb2xsZXIgZHJpdmVycwoj
CgojCiMgUENJIEVuZHBvaW50CiMKIyBDT05GSUdfUENJX0VORFBPSU5UIGlzIG5vdCBzZXQKCiMK
IyBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwojCkNPTkZJR19QQ0lfU1dfU1dJVENIVEVD
PW0KIyBDT05GSUdfSVNBX0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTQV9ETUFfQVBJIGlzIG5v
dCBzZXQKQ09ORklHX0FNRF9OQj15CkNPTkZJR19QQ0NBUkQ9eQojIENPTkZJR19QQ01DSUEgaXMg
bm90IHNldAojIENPTkZJR19DQVJEQlVTIGlzIG5vdCBzZXQKCiMKIyBQQy1jYXJkIGJyaWRnZXMK
IwpDT05GSUdfWUVOVEE9eQpDT05GSUdfWUVOVEFfTzI9eQojIENPTkZJR19ZRU5UQV9SSUNPSCBp
cyBub3Qgc2V0CiMgQ09ORklHX1lFTlRBX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfWUVOVEFfVE9T
SElCQSBpcyBub3Qgc2V0CkNPTkZJR19SQVBJRElPPXkKQ09ORklHX1JBUElESU9fRElTQ19USU1F
T1VUPTMwCiMgQ09ORklHX1JBUElESU9fRU5BQkxFX1JYX1RYX1BPUlRTIGlzIG5vdCBzZXQKQ09O
RklHX1JBUElESU9fRE1BX0VOR0lORT15CkNPTkZJR19SQVBJRElPX0RFQlVHPXkKIyBDT05GSUdf
UkFQSURJT19FTlVNX0JBU0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFQSURJT19DSE1BTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JBUElESU9fTVBPUlRfQ0RFViBpcyBub3Qgc2V0CgojCiMgUmFwaWRJ
TyBTd2l0Y2ggZHJpdmVycwojCkNPTkZJR19SQVBJRElPX1RTSTU3WD1tCiMgQ09ORklHX1JBUElE
SU9fQ1BTX1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFQSURJT19UU0k1NjggaXMgbm90IHNldAoj
IENPTkZJR19SQVBJRElPX0NQU19HRU4yIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFQSURJT19SWFNf
R0VOMyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9TWVNGQiBpcyBub3Qgc2V0CgojCiMgRXhlY3V0
YWJsZSBmaWxlIGZvcm1hdHMgLyBFbXVsYXRpb25zCiMKQ09ORklHX0JJTkZNVF9FTEY9eQpDT05G
SUdfRUxGQ09SRT15CkNPTkZJR19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUz15CkNPTkZJ
R19CSU5GTVRfU0NSSVBUPXkKQ09ORklHX0JJTkZNVF9NSVNDPXkKQ09ORklHX0NPUkVEVU1QPXkK
IyBDT05GSUdfSUEzMl9FTVVMQVRJT04gaXMgbm90IHNldAojIENPTkZJR19YODZfWDMyIGlzIG5v
dCBzZXQKQ09ORklHX1g4Nl9ERVZfRE1BX09QUz15CkNPTkZJR19ORVQ9eQpDT05GSUdfTkVUX0lO
R1JFU1M9eQpDT05GSUdfTkVUX0VHUkVTUz15CgojCiMgTmV0d29ya2luZyBvcHRpb25zCiMKIyBD
T05GSUdfUEFDS0VUIGlzIG5vdCBzZXQKQ09ORklHX1VOSVg9eQpDT05GSUdfVU5JWF9ESUFHPW0K
IyBDT05GSUdfVExTIGlzIG5vdCBzZXQKQ09ORklHX1hGUk09eQojIENPTkZJR19YRlJNX1VTRVIg
aXMgbm90IHNldAojIENPTkZJR19YRlJNX1NVQl9QT0xJQ1kgaXMgbm90IHNldAojIENPTkZJR19Y
RlJNX01JR1JBVEUgaXMgbm90IHNldAojIENPTkZJR19YRlJNX1NUQVRJU1RJQ1MgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfS0VZIGlzIG5vdCBzZXQKQ09ORklHX0lORVQ9eQojIENPTkZJR19JUF9N
VUxUSUNBU1QgaXMgbm90IHNldAojIENPTkZJR19JUF9BRFZBTkNFRF9ST1VURVIgaXMgbm90IHNl
dApDT05GSUdfSVBfUE5QPXkKQ09ORklHX0lQX1BOUF9ESENQPXkKIyBDT05GSUdfSVBfUE5QX0JP
T1RQIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfUE5QX1JBUlAgaXMgbm90IHNldAojIENPTkZJR19O
RVRfSVBJUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9JUEdSRV9ERU1VWCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfSVBfVFVOTkVMPXkKIyBDT05GSUdfU1lOX0NPT0tJRVMgaXMgbm90IHNldAojIENP
TkZJR19ORVRfSVBWVEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfRk9VIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0ZPVV9JUF9UVU5ORUxTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVF9BSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lORVRfRVNQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVF9JUENPTVAg
aXMgbm90IHNldApDT05GSUdfSU5FVF9UVU5ORUw9eQpDT05GSUdfSU5FVF9YRlJNX01PREVfVFJB
TlNQT1JUPXkKQ09ORklHX0lORVRfWEZSTV9NT0RFX1RVTk5FTD15CkNPTkZJR19JTkVUX1hGUk1f
TU9ERV9CRUVUPXkKQ09ORklHX0lORVRfRElBRz15CkNPTkZJR19JTkVUX1RDUF9ESUFHPXkKIyBD
T05GSUdfSU5FVF9VRFBfRElBRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVRfUkFXX0RJQUcgaXMg
bm90IHNldAojIENPTkZJR19JTkVUX0RJQUdfREVTVFJPWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RD
UF9DT05HX0FEVkFOQ0VEIGlzIG5vdCBzZXQKQ09ORklHX1RDUF9DT05HX0NVQklDPXkKQ09ORklH
X0RFRkFVTFRfVENQX0NPTkc9ImN1YmljIgojIENPTkZJR19UQ1BfTUQ1U0lHIGlzIG5vdCBzZXQK
Q09ORklHX0lQVjY9eQojIENPTkZJR19JUFY2X1JPVVRFUl9QUkVGIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBWNl9PUFRJTUlTVElDX0RBRCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVQ2X0FIIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5FVDZfRVNQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVDZfSVBDT01Q
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9NSVA2IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9J
TEEgaXMgbm90IHNldApDT05GSUdfSU5FVDZfWEZSTV9NT0RFX1RSQU5TUE9SVD15CkNPTkZJR19J
TkVUNl9YRlJNX01PREVfVFVOTkVMPXkKQ09ORklHX0lORVQ2X1hGUk1fTU9ERV9CRUVUPXkKIyBD
T05GSUdfSU5FVDZfWEZSTV9NT0RFX1JPVVRFT1BUSU1JWkFUSU9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBWNl9WVEkgaXMgbm90IHNldApDT05GSUdfSVBWNl9TSVQ9eQojIENPTkZJR19JUFY2X1NJ
VF82UkQgaXMgbm90IHNldApDT05GSUdfSVBWNl9ORElTQ19OT0RFVFlQRT15CiMgQ09ORklHX0lQ
VjZfVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9NVUxUSVBMRV9UQUJMRVMgaXMgbm90
IHNldAojIENPTkZJR19JUFY2X01ST1VURSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfU0VHNl9M
V1RVTk5FTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfU0VHNl9ITUFDIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUTEFCRUwgaXMgbm90IHNldApDT05GSUdfTkVUV09SS19TRUNNQVJLPXkKIyBDT05G
SUdfTkVUV09SS19QSFlfVElNRVNUQU1QSU5HIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUj15
CiMgQ09ORklHX05FVEZJTFRFUl9BRFZBTkNFRCBpcyBub3Qgc2V0CgojCiMgQ29yZSBOZXRmaWx0
ZXIgQ29uZmlndXJhdGlvbgojCkNPTkZJR19ORVRGSUxURVJfSU5HUkVTUz15CkNPTkZJR19ORVRG
SUxURVJfTkVUTElOSz1tCkNPTkZJR19ORVRGSUxURVJfTkVUTElOS19MT0c9bQpDT05GSUdfTkZf
Q09OTlRSQUNLPW0KQ09ORklHX05GX0xPR19DT01NT049bQojIENPTkZJR19ORl9MT0dfTkVUREVW
IGlzIG5vdCBzZXQKQ09ORklHX05GX0NPTk5UUkFDS19TRUNNQVJLPXkKQ09ORklHX05GX0NPTk5U
UkFDS19QUk9DRlM9eQpDT05GSUdfTkZfQ09OTlRSQUNLX0ZUUD1tCkNPTkZJR19ORl9DT05OVFJB
Q0tfSVJDPW0KIyBDT05GSUdfTkZfQ09OTlRSQUNLX05FVEJJT1NfTlMgaXMgbm90IHNldApDT05G
SUdfTkZfQ09OTlRSQUNLX1NJUD1tCkNPTkZJR19ORl9DVF9ORVRMSU5LPW0KIyBDT05GSUdfTkVU
RklMVEVSX05FVExJTktfR0xVRV9DVCBpcyBub3Qgc2V0CkNPTkZJR19ORl9OQVQ9bQpDT05GSUdf
TkZfTkFUX05FRURFRD15CkNPTkZJR19ORl9OQVRfRlRQPW0KQ09ORklHX05GX05BVF9JUkM9bQpD
T05GSUdfTkZfTkFUX1NJUD1tCiMgQ09ORklHX05GX05BVF9SRURJUkVDVCBpcyBub3Qgc2V0CiMg
Q09ORklHX05GX1RBQkxFUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxURVJfWFRBQkxFUz1tCgoj
CiMgWHRhYmxlcyBjb21iaW5lZCBtb2R1bGVzCiMKQ09ORklHX05FVEZJTFRFUl9YVF9NQVJLPW0K
CiMKIyBYdGFibGVzIHRhcmdldHMKIwpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9DT05OU0VD
TUFSSz1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0xPRz1tCkNPTkZJR19ORVRGSUxURVJf
WFRfTkFUPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9ORVRNQVAgaXMgbm90IHNldApD
T05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9ORkxPRz1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9U
QVJHRVRfUkVESVJFQ1QgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9TRUNN
QVJLPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVENQTVNTPW0KCiMKIyBYdGFibGVzIG1h
dGNoZXMKIwpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0FERFJUWVBFPW0KQ09ORklHX05FVEZJ
TFRFUl9YVF9NQVRDSF9DT05OVFJBQ0s9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1BPTElD
WT1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RBVEU9bQojIENPTkZJR19JUF9TRVQgaXMg
bm90IHNldAojIENPTkZJR19JUF9WUyBpcyBub3Qgc2V0CgojCiMgSVA6IE5ldGZpbHRlciBDb25m
aWd1cmF0aW9uCiMKQ09ORklHX05GX0RFRlJBR19JUFY0PW0KQ09ORklHX05GX0NPTk5UUkFDS19J
UFY0PW0KIyBDT05GSUdfTkZfU09DS0VUX0lQVjQgaXMgbm90IHNldAojIENPTkZJR19ORl9EVVBf
SVBWNCBpcyBub3Qgc2V0CkNPTkZJR19ORl9MT0dfQVJQPW0KQ09ORklHX05GX0xPR19JUFY0PW0K
Q09ORklHX05GX1JFSkVDVF9JUFY0PW0KQ09ORklHX05GX05BVF9JUFY0PW0KQ09ORklHX05GX05B
VF9NQVNRVUVSQURFX0lQVjQ9bQpDT05GSUdfSVBfTkZfSVBUQUJMRVM9bQpDT05GSUdfSVBfTkZf
RklMVEVSPW0KQ09ORklHX0lQX05GX1RBUkdFVF9SRUpFQ1Q9bQpDT05GSUdfSVBfTkZfTkFUPW0K
Q09ORklHX0lQX05GX1RBUkdFVF9NQVNRVUVSQURFPW0KQ09ORklHX0lQX05GX01BTkdMRT1tCiMg
Q09ORklHX0lQX05GX1JBVyBpcyBub3Qgc2V0CgojCiMgSVB2NjogTmV0ZmlsdGVyIENvbmZpZ3Vy
YXRpb24KIwpDT05GSUdfTkZfREVGUkFHX0lQVjY9bQpDT05GSUdfTkZfQ09OTlRSQUNLX0lQVjY9
bQojIENPTkZJR19ORl9TT0NLRVRfSVBWNiBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0RVUF9JUFY2
IGlzIG5vdCBzZXQKQ09ORklHX05GX1JFSkVDVF9JUFY2PW0KQ09ORklHX05GX0xPR19JUFY2PW0K
Q09ORklHX0lQNl9ORl9JUFRBQkxFUz1tCkNPTkZJR19JUDZfTkZfTUFUQ0hfSVBWNkhFQURFUj1t
CkNPTkZJR19JUDZfTkZfRklMVEVSPW0KQ09ORklHX0lQNl9ORl9UQVJHRVRfUkVKRUNUPW0KQ09O
RklHX0lQNl9ORl9NQU5HTEU9bQojIENPTkZJR19JUDZfTkZfUkFXIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBfRENDUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1NDVFAgaXMgbm90IHNldAojIENPTkZJ
R19SRFMgaXMgbm90IHNldAojIENPTkZJR19USVBDIGlzIG5vdCBzZXQKQ09ORklHX0FUTT1tCiMg
Q09ORklHX0FUTV9DTElQIGlzIG5vdCBzZXQKQ09ORklHX0FUTV9MQU5FPW0KIyBDT05GSUdfQVRN
X01QT0EgaXMgbm90IHNldAojIENPTkZJR19BVE1fQlIyNjg0IGlzIG5vdCBzZXQKIyBDT05GSUdf
TDJUUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRSBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX05F
VF9EU0E9eQojIENPTkZJR19ORVRfRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfVkxBTl84MDIxUSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQ05FVCBpcyBub3Qgc2V0CkNPTkZJR19MTEM9eQpDT05GSUdf
TExDMj15CkNPTkZJR19BVEFMSz15CkNPTkZJR19ERVZfQVBQTEVUQUxLPW0KQ09ORklHX0lQRERQ
PW0KIyBDT05GSUdfSVBERFBfRU5DQVAgaXMgbm90IHNldApDT05GSUdfWDI1PXkKQ09ORklHX0xB
UEI9bQojIENPTkZJR19QSE9ORVQgaXMgbm90IHNldAojIENPTkZJR182TE9XUEFOIGlzIG5vdCBz
ZXQKQ09ORklHX0lFRUU4MDIxNTQ9eQojIENPTkZJR19JRUVFODAyMTU0X05MODAyMTU0X0VYUEVS
SU1FTlRBTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lFRUU4MDIxNTRfU09DS0VUIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUFDODAyMTU0IGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hFRD15CgojCiMgUXVl
dWVpbmcvU2NoZWR1bGluZwojCkNPTkZJR19ORVRfU0NIX0NCUT1tCkNPTkZJR19ORVRfU0NIX0hU
Qj15CiMgQ09ORklHX05FVF9TQ0hfSEZTQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfQVRN
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfUFJJTz1tCkNPTkZJR19ORVRfU0NIX01VTFRJUT15
CiMgQ09ORklHX05FVF9TQ0hfUkVEIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfU0ZCPXkKQ09O
RklHX05FVF9TQ0hfU0ZRPXkKQ09ORklHX05FVF9TQ0hfVEVRTD1tCkNPTkZJR19ORVRfU0NIX1RC
Rj15CkNPTkZJR19ORVRfU0NIX0NCUz15CkNPTkZJR19ORVRfU0NIX0dSRUQ9eQpDT05GSUdfTkVU
X1NDSF9EU01BUks9eQojIENPTkZJR19ORVRfU0NIX05FVEVNIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9TQ0hfRFJSPW0KQ09ORklHX05FVF9TQ0hfTVFQUklPPXkKQ09ORklHX05FVF9TQ0hfQ0hPS0U9
bQpDT05GSUdfTkVUX1NDSF9RRlE9bQojIENPTkZJR19ORVRfU0NIX0NPREVMIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1NDSF9GUV9DT0RFTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRlEg
aXMgbm90IHNldApDT05GSUdfTkVUX1NDSF9ISEY9eQpDT05GSUdfTkVUX1NDSF9QSUU9bQpDT05G
SUdfTkVUX1NDSF9JTkdSRVNTPXkKIyBDT05GSUdfTkVUX1NDSF9QTFVHIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9TQ0hfREVGQVVMVD15CiMgQ09ORklHX0RFRkFVTFRfU0ZRIGlzIG5vdCBzZXQKQ09O
RklHX0RFRkFVTFRfUEZJRk9fRkFTVD15CkNPTkZJR19ERUZBVUxUX05FVF9TQ0g9InBmaWZvX2Zh
c3QiCgojCiMgQ2xhc3NpZmljYXRpb24KIwpDT05GSUdfTkVUX0NMUz15CkNPTkZJR19ORVRfQ0xT
X0JBU0lDPXkKIyBDT05GSUdfTkVUX0NMU19UQ0lOREVYIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X0NMU19ST1VURTQgaXMgbm90IHNldApDT05GSUdfTkVUX0NMU19GVz15CkNPTkZJR19ORVRfQ0xT
X1UzMj15CkNPTkZJR19DTFNfVTMyX1BFUkY9eQpDT05GSUdfQ0xTX1UzMl9NQVJLPXkKQ09ORklH
X05FVF9DTFNfUlNWUD15CkNPTkZJR19ORVRfQ0xTX1JTVlA2PXkKQ09ORklHX05FVF9DTFNfRkxP
Vz1tCkNPTkZJR19ORVRfQ0xTX0NHUk9VUD1tCkNPTkZJR19ORVRfQ0xTX0JQRj1tCkNPTkZJR19O
RVRfQ0xTX0ZMT1dFUj1tCkNPTkZJR19ORVRfQ0xTX01BVENIQUxMPW0KIyBDT05GSUdfTkVUX0VN
QVRDSCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQ0xTX0FDVD15CkNPTkZJR19ORVRfQUNUX1BPTElD
RT1tCkNPTkZJR19ORVRfQUNUX0dBQ1Q9eQpDT05GSUdfR0FDVF9QUk9CPXkKQ09ORklHX05FVF9B
Q1RfTUlSUkVEPXkKQ09ORklHX05FVF9BQ1RfU0FNUExFPXkKIyBDT05GSUdfTkVUX0FDVF9JUFQg
aXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX05BVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQUNU
X1BFRElUPW0KQ09ORklHX05FVF9BQ1RfU0lNUD1tCiMgQ09ORklHX05FVF9BQ1RfU0tCRURJVCBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfQ1NVTSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9B
Q1RfVkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfQlBGIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9BQ1RfU0tCTU9EPXkKQ09ORklHX05FVF9BQ1RfSUZFPXkKQ09ORklHX05FVF9BQ1RfVFVO
TkVMX0tFWT15CkNPTkZJR19ORVRfSUZFX1NLQk1BUks9eQojIENPTkZJR19ORVRfSUZFX1NLQlBS
SU8gaXMgbm90IHNldApDT05GSUdfTkVUX0lGRV9TS0JUQ0lOREVYPW0KIyBDT05GSUdfTkVUX0NM
U19JTkQgaXMgbm90IHNldApDT05GSUdfTkVUX1NDSF9GSUZPPXkKQ09ORklHX0RDQj15CkNPTkZJ
R19ETlNfUkVTT0xWRVI9eQpDT05GSUdfQkFUTUFOX0FEVj1tCiMgQ09ORklHX0JBVE1BTl9BRFZf
QkFUTUFOX1YgaXMgbm90IHNldApDT05GSUdfQkFUTUFOX0FEVl9CTEE9eQojIENPTkZJR19CQVRN
QU5fQURWX0RBVCBpcyBub3Qgc2V0CkNPTkZJR19CQVRNQU5fQURWX05DPXkKIyBDT05GSUdfQkFU
TUFOX0FEVl9NQ0FTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVE1BTl9BRFZfREVCVUdGUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX09QRU5WU1dJVENIIGlzIG5vdCBzZXQKQ09ORklHX1ZTT0NLRVRTPW0K
Q09ORklHX1ZTT0NLRVRTX0RJQUc9bQojIENPTkZJR19WSVJUSU9fVlNPQ0tFVFMgaXMgbm90IHNl
dAojIENPTkZJR19ORVRMSU5LX0RJQUcgaXMgbm90IHNldApDT05GSUdfTVBMUz15CkNPTkZJR19O
RVRfTVBMU19HU089bQpDT05GSUdfTVBMU19ST1VUSU5HPXkKQ09ORklHX05FVF9OU0g9eQpDT05G
SUdfSFNSPXkKIyBDT05GSUdfTkVUX1NXSVRDSERFViBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9M
M19NQVNURVJfREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX05DU0kgaXMgbm90IHNldApDT05G
SUdfQ0dST1VQX05FVF9QUklPPXkKQ09ORklHX0NHUk9VUF9ORVRfQ0xBU1NJRD15CkNPTkZJR19O
RVRfUlhfQlVTWV9QT0xMPXkKQ09ORklHX0JRTD15CkNPTkZJR19CUEZfSklUPXkKIyBDT05GSUdf
QlBGX1NUUkVBTV9QQVJTRVIgaXMgbm90IHNldAoKIwojIE5ldHdvcmsgdGVzdGluZwojCiMgQ09O
RklHX05FVF9QS1RHRU4gaXMgbm90IHNldApDT05GSUdfSEFNUkFESU89eQoKIwojIFBhY2tldCBS
YWRpbyBwcm90b2NvbHMKIwpDT05GSUdfQVgyNT15CkNPTkZJR19BWDI1X0RBTUFfU0xBVkU9eQoj
IENPTkZJR19ORVRST00gaXMgbm90IHNldAojIENPTkZJR19ST1NFIGlzIG5vdCBzZXQKCiMKIyBB
WC4yNSBuZXR3b3JrIGRldmljZSBkcml2ZXJzCiMKQ09ORklHX01LSVNTPW0KQ09ORklHXzZQQUNL
PW0KQ09ORklHX0JQUUVUSEVSPXkKQ09ORklHX0JBWUNPTV9TRVJfRkRYPXkKIyBDT05GSUdfQkFZ
Q09NX1NFUl9IRFggaXMgbm90IHNldAojIENPTkZJR19CQVlDT01fUEFSIGlzIG5vdCBzZXQKIyBD
T05GSUdfWUFNIGlzIG5vdCBzZXQKQ09ORklHX0NBTj15CkNPTkZJR19DQU5fUkFXPW0KIyBDT05G
SUdfQ0FOX0JDTSBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9HVyBpcyBub3Qgc2V0CgojCiMgQ0FO
IERldmljZSBEcml2ZXJzCiMKQ09ORklHX0NBTl9WQ0FOPXkKQ09ORklHX0NBTl9WWENBTj1tCiMg
Q09ORklHX0NBTl9TTENBTiBpcyBub3Qgc2V0CkNPTkZJR19DQU5fREVWPW0KIyBDT05GSUdfQ0FO
X0NBTENfQklUVElNSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX0xFRFMgaXMgbm90IHNldAoj
IENPTkZJR19DQU5fR1JDQU4gaXMgbm90IHNldApDT05GSUdfQ0FOX0pBTlpfSUNBTjM9bQpDT05G
SUdfQ0FOX0NfQ0FOPW0KQ09ORklHX0NBTl9DX0NBTl9QTEFURk9STT1tCkNPTkZJR19DQU5fQ19D
QU5fUENJPW0KIyBDT05GSUdfQ0FOX0NDNzcwIGlzIG5vdCBzZXQKQ09ORklHX0NBTl9JRklfQ0FO
RkQ9bQpDT05GSUdfQ0FOX01fQ0FOPW0KQ09ORklHX0NBTl9QRUFLX1BDSUVGRD1tCkNPTkZJR19D
QU5fU0pBMTAwMD1tCkNPTkZJR19DQU5fU0pBMTAwMF9JU0E9bQpDT05GSUdfQ0FOX1NKQTEwMDBf
UExBVEZPUk09bQpDT05GSUdfQ0FOX0VNU19QQ0k9bQpDT05GSUdfQ0FOX1BFQUtfUENJPW0KQ09O
RklHX0NBTl9QRUFLX1BDSUVDPXkKIyBDT05GSUdfQ0FOX0tWQVNFUl9QQ0kgaXMgbm90IHNldApD
T05GSUdfQ0FOX1BMWF9QQ0k9bQpDT05GSUdfQ0FOX1NPRlRJTkc9bQoKIwojIENBTiBTUEkgaW50
ZXJmYWNlcwojCkNPTkZJR19DQU5fSEkzMTFYPW0KIyBDT05GSUdfQ0FOX01DUDI1MVggaXMgbm90
IHNldAojIENPTkZJR19DQU5fREVCVUdfREVWSUNFUyBpcyBub3Qgc2V0CkNPTkZJR19CVD1tCkNP
TkZJR19CVF9CUkVEUj15CiMgQ09ORklHX0JUX1JGQ09NTSBpcyBub3Qgc2V0CkNPTkZJR19CVF9C
TkVQPW0KIyBDT05GSUdfQlRfQk5FUF9NQ19GSUxURVIgaXMgbm90IHNldAojIENPTkZJR19CVF9C
TkVQX1BST1RPX0ZJTFRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX0hJRFAgaXMgbm90IHNldApD
T05GSUdfQlRfSFM9eQojIENPTkZJR19CVF9MRSBpcyBub3Qgc2V0CkNPTkZJR19CVF9MRURTPXkK
Q09ORklHX0JUX1NFTEZURVNUPXkKIyBDT05GSUdfQlRfREVCVUdGUyBpcyBub3Qgc2V0CgojCiMg
Qmx1ZXRvb3RoIGRldmljZSBkcml2ZXJzCiMKQ09ORklHX0JUX0hDSUJUU0RJTz1tCiMgQ09ORklH
X0JUX0hDSVVBUlQgaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lWSENJIGlzIG5vdCBzZXQKIyBD
T05GSUdfQlRfTVJWTCBpcyBub3Qgc2V0CiMgQ09ORklHX0FGX1JYUlBDIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUZfS0NNIGlzIG5vdCBzZXQKQ09ORklHX1dJUkVMRVNTPXkKIyBDT05GSUdfQ0ZHODAy
MTEgaXMgbm90IHNldAoKIwojIENGRzgwMjExIG5lZWRzIHRvIGJlIGVuYWJsZWQgZm9yIE1BQzgw
MjExCiMKQ09ORklHX01BQzgwMjExX1NUQV9IQVNIX01BWF9TSVpFPTAKIyBDT05GSUdfV0lNQVgg
aXMgbm90IHNldApDT05GSUdfUkZLSUxMPW0KQ09ORklHX1JGS0lMTF9MRURTPXkKIyBDT05GSUdf
UkZLSUxMX0lOUFVUIGlzIG5vdCBzZXQKQ09ORklHX1JGS0lMTF9HUElPPW0KQ09ORklHX05FVF85
UD1tCiMgQ09ORklHX05FVF85UF9WSVJUSU8gaXMgbm90IHNldAojIENPTkZJR19ORVRfOVBfREVC
VUcgaXMgbm90IHNldApDT05GSUdfQ0FJRj1tCiMgQ09ORklHX0NBSUZfREVCVUcgaXMgbm90IHNl
dApDT05GSUdfQ0FJRl9ORVRERVY9bQpDT05GSUdfQ0FJRl9VU0I9bQojIENPTkZJR19DRVBIX0xJ
QiBpcyBub3Qgc2V0CiMgQ09ORklHX05GQyBpcyBub3Qgc2V0CkNPTkZJR19QU0FNUExFPXkKQ09O
RklHX05FVF9JRkU9eQojIENPTkZJR19MV1RVTk5FTCBpcyBub3Qgc2V0CkNPTkZJR19EU1RfQ0FD
SEU9eQpDT05GSUdfR1JPX0NFTExTPXkKQ09ORklHX05FVF9ERVZMSU5LPXkKQ09ORklHX01BWV9V
U0VfREVWTElOSz15CkNPTkZJR19IQVZFX0VCUEZfSklUPXkKCiMKIyBEZXZpY2UgRHJpdmVycwoj
CgojCiMgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwojCiMgQ09ORklHX1VFVkVOVF9IRUxQRVIgaXMg
bm90IHNldApDT05GSUdfREVWVE1QRlM9eQojIENPTkZJR19ERVZUTVBGU19NT1VOVCBpcyBub3Qg
c2V0CkNPTkZJR19TVEFOREFMT05FPXkKQ09ORklHX1BSRVZFTlRfRklSTVdBUkVfQlVJTEQ9eQpD
T05GSUdfRldfTE9BREVSPXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCkNPTkZJR19GV19MT0FE
RVJfVVNFUl9IRUxQRVI9eQojIENPTkZJR19GV19MT0FERVJfVVNFUl9IRUxQRVJfRkFMTEJBQ0sg
aXMgbm90IHNldApDT05GSUdfV0FOVF9ERVZfQ09SRURVTVA9eQojIENPTkZJR19BTExPV19ERVZf
Q09SRURVTVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19EUklWRVIgaXMgbm90IHNldApDT05G
SUdfREVCVUdfREVWUkVTPXkKIyBDT05GSUdfREVCVUdfVEVTVF9EUklWRVJfUkVNT1ZFIGlzIG5v
dCBzZXQKQ09ORklHX1RFU1RfQVNZTkNfRFJJVkVSX1BST0JFPW0KQ09ORklHX0dFTkVSSUNfQ1BV
X0FVVE9QUk9CRT15CkNPTkZJR19HRU5FUklDX0NQVV9WVUxORVJBQklMSVRJRVM9eQpDT05GSUdf
UkVHTUFQPXkKQ09ORklHX1JFR01BUF9JMkM9eQpDT05GSUdfUkVHTUFQX1NQST15CkNPTkZJR19S
RUdNQVBfU1BNST1tCkNPTkZJR19SRUdNQVBfTU1JTz15CkNPTkZJR19SRUdNQVBfSVJRPXkKQ09O
RklHX0RNQV9TSEFSRURfQlVGRkVSPXkKQ09ORklHX0RNQV9GRU5DRV9UUkFDRT15CkNPTkZJR19E
TUFfQ01BPXkKCiMKIyBEZWZhdWx0IGNvbnRpZ3VvdXMgbWVtb3J5IGFyZWEgc2l6ZToKIwpDT05G
SUdfQ01BX1NJWkVfTUJZVEVTPTAKQ09ORklHX0NNQV9TSVpFX1BFUkNFTlRBR0U9MAojIENPTkZJ
R19DTUFfU0laRV9TRUxfTUJZVEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01BX1NJWkVfU0VMX1BF
UkNFTlRBR0UgaXMgbm90IHNldApDT05GSUdfQ01BX1NJWkVfU0VMX01JTj15CiMgQ09ORklHX0NN
QV9TSVpFX1NFTF9NQVggaXMgbm90IHNldApDT05GSUdfQ01BX0FMSUdOTUVOVD04CgojCiMgQnVz
IGRldmljZXMKIwpDT05GSUdfU0lNUExFX1BNX0JVUz1tCkNPTkZJR19DT05ORUNUT1I9bQpDT05G
SUdfTVREPXkKQ09ORklHX01URF9URVNUUz1tCkNPTkZJR19NVERfUkVEQk9PVF9QQVJUUz15CkNP
TkZJR19NVERfUkVEQk9PVF9ESVJFQ1RPUllfQkxPQ0s9LTEKQ09ORklHX01URF9SRURCT09UX1BB
UlRTX1VOQUxMT0NBVEVEPXkKQ09ORklHX01URF9SRURCT09UX1BBUlRTX1JFQURPTkxZPXkKQ09O
RklHX01URF9DTURMSU5FX1BBUlRTPXkKIyBDT05GSUdfTVREX09GX1BBUlRTIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVREX0FSN19QQVJUUyBpcyBub3Qgc2V0CgojCiMgUGFydGl0aW9uIHBhcnNlcnMK
IwoKIwojIFVzZXIgTW9kdWxlcyBBbmQgVHJhbnNsYXRpb24gTGF5ZXJzCiMKIyBDT05GSUdfTVRE
X09PUFMgaXMgbm90IHNldApDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj15CgojCiMgUkFN
L1JPTS9GbGFzaCBjaGlwIGRyaXZlcnMKIwpDT05GSUdfTVREX0NGST1tCkNPTkZJR19NVERfSkVE
RUNQUk9CRT15CkNPTkZJR19NVERfR0VOX1BST0JFPXkKQ09ORklHX01URF9DRklfQURWX09QVElP
TlM9eQojIENPTkZJR19NVERfQ0ZJX05PU1dBUCBpcyBub3Qgc2V0CkNPTkZJR19NVERfQ0ZJX0JF
X0JZVEVfU1dBUD15CiMgQ09ORklHX01URF9DRklfTEVfQllURV9TV0FQIGlzIG5vdCBzZXQKQ09O
RklHX01URF9DRklfR0VPTUVUUlk9eQpDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzE9eQojIENP
TkZJR19NVERfTUFQX0JBTktfV0lEVEhfMiBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9NQVBfQkFO
S19XSURUSF80IGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzggaXMgbm90
IHNldAojIENPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfMTYgaXMgbm90IHNldAojIENPTkZJR19N
VERfTUFQX0JBTktfV0lEVEhfMzIgaXMgbm90IHNldApDT05GSUdfTVREX0NGSV9JMT15CiMgQ09O
RklHX01URF9DRklfSTIgaXMgbm90IHNldApDT05GSUdfTVREX0NGSV9JND15CiMgQ09ORklHX01U
RF9DRklfSTggaXMgbm90IHNldAojIENPTkZJR19NVERfT1RQIGlzIG5vdCBzZXQKQ09ORklHX01U
RF9DRklfSU5URUxFWFQ9eQpDT05GSUdfTVREX0NGSV9BTURTVEQ9eQpDT05GSUdfTVREX0NGSV9T
VEFBPW0KQ09ORklHX01URF9DRklfVVRJTD15CkNPTkZJR19NVERfUkFNPXkKIyBDT05GSUdfTVRE
X1JPTSBpcyBub3Qgc2V0CkNPTkZJR19NVERfQUJTRU5UPXkKCiMKIyBNYXBwaW5nIGRyaXZlcnMg
Zm9yIGNoaXAgYWNjZXNzCiMKQ09ORklHX01URF9DT01QTEVYX01BUFBJTkdTPXkKQ09ORklHX01U
RF9QSFlTTUFQPW0KQ09ORklHX01URF9QSFlTTUFQX0NPTVBBVD15CkNPTkZJR19NVERfUEhZU01B
UF9TVEFSVD0weDgwMDAwMDAKQ09ORklHX01URF9QSFlTTUFQX0xFTj0wCkNPTkZJR19NVERfUEhZ
U01BUF9CQU5LV0lEVEg9MgpDT05GSUdfTVREX1BIWVNNQVBfT0Y9bQojIENPTkZJR19NVERfUEhZ
U01BUF9PRl9WRVJTQVRJTEUgaXMgbm90IHNldAojIENPTkZJR19NVERfUEhZU01BUF9PRl9HRU1J
TkkgaXMgbm90IHNldApDT05GSUdfTVREX1NCQ19HWFg9eQpDT05GSUdfTVREX0FNRDc2WFJPTT15
CkNPTkZJR19NVERfSUNIWFJPTT15CkNPTkZJR19NVERfRVNCMlJPTT15CiMgQ09ORklHX01URF9D
SzgwNFhST00gaXMgbm90IHNldApDT05GSUdfTVREX1NDQjJfRkxBU0g9bQojIENPTkZJR19NVERf
TkVUdGVsIGlzIG5vdCBzZXQKQ09ORklHX01URF9MNDQwR1g9eQpDT05GSUdfTVREX1BDST1tCiMg
Q09ORklHX01URF9HUElPX0FERFIgaXMgbm90IHNldApDT05GSUdfTVREX0lOVEVMX1ZSX05PUj15
CiMgQ09ORklHX01URF9QTEFUUkFNIGlzIG5vdCBzZXQKQ09ORklHX01URF9MQVRDSF9BRERSPW0K
CiMKIyBTZWxmLWNvbnRhaW5lZCBNVEQgZGV2aWNlIGRyaXZlcnMKIwojIENPTkZJR19NVERfUE1D
NTUxIGlzIG5vdCBzZXQKQ09ORklHX01URF9EQVRBRkxBU0g9eQojIENPTkZJR19NVERfREFUQUZM
QVNIX1dSSVRFX1ZFUklGWSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9EQVRBRkxBU0hfT1RQIGlz
IG5vdCBzZXQKQ09ORklHX01URF9NMjVQODA9bQojIENPTkZJR19NVERfTUNIUDIzSzI1NiBpcyBu
b3Qgc2V0CkNPTkZJR19NVERfU1NUMjVMPW0KIyBDT05GSUdfTVREX1NMUkFNIGlzIG5vdCBzZXQK
Q09ORklHX01URF9QSFJBTT15CkNPTkZJR19NVERfTVREUkFNPW0KQ09ORklHX01URFJBTV9UT1RB
TF9TSVpFPTQwOTYKQ09ORklHX01URFJBTV9FUkFTRV9TSVpFPTEyOAoKIwojIERpc2stT24tQ2hp
cCBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19NVERfRE9DRzM9bQpDT05GSUdfQkNIX0NPTlNUX009
MTQKQ09ORklHX0JDSF9DT05TVF9UPTQKIyBDT05GSUdfTVREX09ORU5BTkQgaXMgbm90IHNldAoj
IENPTkZJR19NVERfTkFORCBpcyBub3Qgc2V0CgojCiMgTFBERFIgJiBMUEREUjIgUENNIG1lbW9y
eSBkcml2ZXJzCiMKIyBDT05GSUdfTVREX0xQRERSIGlzIG5vdCBzZXQKQ09ORklHX01URF9TUElf
Tk9SPXkKQ09ORklHX01URF9NVDgxeHhfTk9SPW0KIyBDT05GSUdfTVREX1NQSV9OT1JfVVNFXzRL
X1NFQ1RPUlMgaXMgbm90IHNldApDT05GSUdfU1BJX0lOVEVMX1NQST1tCiMgQ09ORklHX1NQSV9J
TlRFTF9TUElfUENJIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9JTlRFTF9TUElfUExBVEZPUk09bQpD
T05GSUdfTVREX1VCST1tCkNPTkZJR19NVERfVUJJX1dMX1RIUkVTSE9MRD00MDk2CkNPTkZJR19N
VERfVUJJX0JFQl9MSU1JVD0yMApDT05GSUdfTVREX1VCSV9GQVNUTUFQPXkKQ09ORklHX01URF9V
QklfR0xVRUJJPW0KQ09ORklHX09GPXkKIyBDT05GSUdfT0ZfVU5JVFRFU1QgaXMgbm90IHNldApD
T05GSUdfT0ZfS09CSj15CkNPTkZJR19PRl9BRERSRVNTPXkKQ09ORklHX09GX0lSUT15CkNPTkZJ
R19PRl9ORVQ9eQojIENPTkZJR19PRl9PVkVSTEFZIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfTUlH
SFRfSEFWRV9QQ19QQVJQT1JUPXkKQ09ORklHX1BBUlBPUlQ9eQpDT05GSUdfUEFSUE9SVF9QQz1t
CiMgQ09ORklHX1BBUlBPUlRfUENfRklGTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBUlBPUlRfUENf
U1VQRVJJTyBpcyBub3Qgc2V0CkNPTkZJR19QQVJQT1JUX0FYODg3OTY9eQpDT05GSUdfUEFSUE9S
VF8xMjg0PXkKQ09ORklHX1BBUlBPUlRfTk9UX1BDPXkKQ09ORklHX1BOUD15CkNPTkZJR19QTlBf
REVCVUdfTUVTU0FHRVM9eQoKIwojIFByb3RvY29scwojCkNPTkZJR19QTlBBQ1BJPXkKCiMKIyBO
Vk1FIFN1cHBvcnQKIwoKIwojIE1pc2MgZGV2aWNlcwojCiMgQ09ORklHX0FENTI1WF9EUE9UIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFVNTVlfSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdfSUJNX0FTTSBp
cyBub3Qgc2V0CkNPTkZJR19QSEFOVE9NPXkKQ09ORklHX1NHSV9JT0M0PW0KQ09ORklHX1RJRk1f
Q09SRT1tCkNPTkZJR19USUZNXzdYWDE9bQojIENPTkZJR19JQ1M5MzJTNDAxIGlzIG5vdCBzZXQK
IyBDT05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTIGlzIG5vdCBzZXQKQ09ORklHX0hQX0lMTz1tCkNP
TkZJR19BUERTOTgwMkFMUz15CkNPTkZJR19JU0wyOTAwMz1tCiMgQ09ORklHX0lTTDI5MDIwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UU0wyNTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19CSDE3NzAgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19BUERTOTkwWD1tCiMgQ09ORklH
X0hNQzYzNTIgaXMgbm90IHNldAojIENPTkZJR19EUzE2ODIgaXMgbm90IHNldApDT05GSUdfVVNC
X1NXSVRDSF9GU0E5NDgwPXkKQ09ORklHX0xBVFRJQ0VfRUNQM19DT05GSUc9bQpDT05GSUdfU1JB
TT15CkNPTkZJR19QQ0lfRU5EUE9JTlRfVEVTVD1tCkNPTkZJR19NSVNDX1JUU1g9eQpDT05GSUdf
QzJQT1JUPW0KQ09ORklHX0MyUE9SVF9EVVJBTUFSXzIxNTA9bQoKIwojIEVFUFJPTSBzdXBwb3J0
CiMKIyBDT05GSUdfRUVQUk9NX0FUMjQgaXMgbm90IHNldApDT05GSUdfRUVQUk9NX0FUMjU9bQpD
T05GSUdfRUVQUk9NX0xFR0FDWT1tCiMgQ09ORklHX0VFUFJPTV9NQVg2ODc1IGlzIG5vdCBzZXQK
Q09ORklHX0VFUFJPTV85M0NYNj15CkNPTkZJR19FRVBST01fOTNYWDQ2PW0KIyBDT05GSUdfRUVQ
Uk9NX0lEVF84OUhQRVNYIGlzIG5vdCBzZXQKQ09ORklHX0NCNzEwX0NPUkU9eQpDT05GSUdfQ0I3
MTBfREVCVUc9eQpDT05GSUdfQ0I3MTBfREVCVUdfQVNTVU1QVElPTlM9eQoKIwojIFRleGFzIElu
c3RydW1lbnRzIHNoYXJlZCB0cmFuc3BvcnQgbGluZSBkaXNjaXBsaW5lCiMKIyBDT05GSUdfVElf
U1QgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xJUzNfSTJDIGlzIG5vdCBzZXQKQ09ORklH
X0FMVEVSQV9TVEFQTD15CkNPTkZJR19JTlRFTF9NRUk9eQojIENPTkZJR19JTlRFTF9NRUlfTUUg
aXMgbm90IHNldApDT05GSUdfSU5URUxfTUVJX1RYRT15CiMgQ09ORklHX1ZNV0FSRV9WTUNJIGlz
IG5vdCBzZXQKCiMKIyBJbnRlbCBNSUMgJiByZWxhdGVkIHN1cHBvcnQKIwoKIwojIEludGVsIE1J
QyBCdXMgRHJpdmVyCiMKQ09ORklHX0lOVEVMX01JQ19CVVM9bQoKIwojIFNDSUYgQnVzIERyaXZl
cgojCkNPTkZJR19TQ0lGX0JVUz1tCgojCiMgVk9QIEJ1cyBEcml2ZXIKIwpDT05GSUdfVk9QX0JV
Uz1tCgojCiMgSW50ZWwgTUlDIEhvc3QgRHJpdmVyCiMKQ09ORklHX0lOVEVMX01JQ19IT1NUPW0K
CiMKIyBJbnRlbCBNSUMgQ2FyZCBEcml2ZXIKIwojIENPTkZJR19JTlRFTF9NSUNfQ0FSRCBpcyBu
b3Qgc2V0CgojCiMgU0NJRiBEcml2ZXIKIwpDT05GSUdfU0NJRj1tCgojCiMgSW50ZWwgTUlDIENv
cHJvY2Vzc29yIFN0YXRlIE1hbmFnZW1lbnQgKENPU00pIERyaXZlcnMKIwpDT05GSUdfTUlDX0NP
U009bQoKIwojIFZPUCBEcml2ZXIKIwpDT05GSUdfVk9QPW0KQ09ORklHX1ZIT1NUX1JJTkc9bQpD
T05GSUdfR0VOV1FFPW0KQ09ORklHX0dFTldRRV9QTEFURk9STV9FUlJPUl9SRUNPVkVSWT0wCkNP
TkZJR19FQ0hPPW0KQ09ORklHX01JU0NfUlRTWF9QQ0k9eQpDT05GSUdfSEFWRV9JREU9eQoKIwoj
IFNDU0kgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfU0NTSV9NT0Q9eQpDT05GSUdfRlVTSU9OPXkK
Q09ORklHX0ZVU0lPTl9NQVhfU0dFPTEyOAojIENPTkZJR19GVVNJT05fTE9HR0lORyBpcyBub3Qg
c2V0CgojCiMgSUVFRSAxMzk0IChGaXJlV2lyZSkgc3VwcG9ydAojCiMgQ09ORklHX0ZJUkVXSVJF
IGlzIG5vdCBzZXQKQ09ORklHX0ZJUkVXSVJFX05PU1k9bQpDT05GSUdfTUFDSU5UT1NIX0RSSVZF
UlM9eQojIENPTkZJR19NQUNfRU1VTU9VU0VCVE4gaXMgbm90IHNldApDT05GSUdfTkVUREVWSUNF
Uz15CkNPTkZJR19ORVRfQ09SRT15CiMgQ09ORklHX0JPTkRJTkcgaXMgbm90IHNldAojIENPTkZJ
R19EVU1NWSBpcyBub3Qgc2V0CiMgQ09ORklHX0VRVUFMSVpFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0lGQiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9URUFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFD
VkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZYTEFO
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDU0VDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUQ09OU09M
RSBpcyBub3Qgc2V0CiMgQ09ORklHX05UQl9ORVRERVYgaXMgbm90IHNldAojIENPTkZJR19SSU9O
RVQgaXMgbm90IHNldAojIENPTkZJR19UVU4gaXMgbm90IHNldAojIENPTkZJR19UVU5fVk5FVF9D
Uk9TU19MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZFVEggaXMgbm90IHNldAojIENPTkZJR19WSVJU
SU9fTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxNT04gaXMgbm90IHNldAojIENPTkZJR19BUkNO
RVQgaXMgbm90IHNldApDT05GSUdfQVRNX0RSSVZFUlM9eQojIENPTkZJR19BVE1fRFVNTVkgaXMg
bm90IHNldAojIENPTkZJR19BVE1fVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRNX0xBTkFJIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVRNX0VOSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTV9GSVJFU1RS
RUFNIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRNX1pBVE0gaXMgbm90IHNldAojIENPTkZJR19BVE1f
TklDU1RBUiBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTV9JRFQ3NzI1MiBpcyBub3Qgc2V0CiMgQ09O
RklHX0FUTV9BTUJBU1NBRE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRNX0hPUklaT04gaXMgbm90
IHNldAojIENPTkZJR19BVE1fSUEgaXMgbm90IHNldAojIENPTkZJR19BVE1fRk9SRTIwMEUgaXMg
bm90IHNldAojIENPTkZJR19BVE1fSEUgaXMgbm90IHNldAojIENPTkZJR19BVE1fU09MT1MgaXMg
bm90IHNldAoKIwojIENBSUYgdHJhbnNwb3J0IGRyaXZlcnMKIwojIENPTkZJR19DQUlGX1RUWSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NBSUZfU1BJX1NMQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FJ
Rl9IU0kgaXMgbm90IHNldAojIENPTkZJR19DQUlGX1ZJUlRJTyBpcyBub3Qgc2V0CgojCiMgRGlz
dHJpYnV0ZWQgU3dpdGNoIEFyY2hpdGVjdHVyZSBkcml2ZXJzCiMKQ09ORklHX0VUSEVSTkVUPXkK
Q09ORklHX01ESU89bQpDT05GSUdfTkVUX1ZFTkRPUl8zQ09NPXkKIyBDT05GSUdfVk9SVEVYIGlz
IG5vdCBzZXQKIyBDT05GSUdfVFlQSE9PTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FE
QVBURUM9eQojIENPTkZJR19BREFQVEVDX1NUQVJGSVJFIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfQUdFUkU9eQojIENPTkZJR19FVDEzMVggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9BTEFDUklURUNIPXkKIyBDT05GSUdfU0xJQ09TUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVO
RE9SX0FMVEVPTj15CiMgQ09ORklHX0FDRU5JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FMVEVSQV9U
U0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BTUFaT049eQpDT05GSUdfTkVUX1ZFTkRP
Ul9BTUQ9eQojIENPTkZJR19BTUQ4MTExX0VUSCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDTkVUMzIg
aXMgbm90IHNldAojIENPTkZJR19BTURfWEdCRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9S
X0FRVUFOVElBPXkKIyBDT05GSUdfQVFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1Jf
QVJDPXkKQ09ORklHX05FVF9WRU5ET1JfQVRIRVJPUz15CiMgQ09ORklHX0FUTDIgaXMgbm90IHNl
dAojIENPTkZJR19BVEwxIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRMMUUgaXMgbm90IHNldAojIENP
TkZJR19BVEwxQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FMWCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfQVVST1JBIGlzIG5vdCBzZXQKQ09ORklHX05FVF9DQURFTkNFPXkKIyBDT05GSUdf
TUFDQiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0JST0FEQ09NPXkKIyBDT05GSUdfQjQ0
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNR0VORVQgaXMgbm90IHNldAojIENPTkZJR19CTlgyIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ05JQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RJR09OMyBpcyBub3Qg
c2V0CiMgQ09ORklHX0JOWDJYIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTVEVNUE9SVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0JOWFQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9CUk9DQURFPXkK
IyBDT05GSUdfQk5BIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0FWSVVNPXkKIyBDT05G
SUdfVEhVTkRFUl9OSUNfUEYgaXMgbm90IHNldAojIENPTkZJR19USFVOREVSX05JQ19WRiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RIVU5ERVJfTklDX0JHWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RIVU5E
RVJfTklDX1JHWCBpcyBub3Qgc2V0CkNPTkZJR19DQVZJVU1fUFRQPXkKIyBDT05GSUdfTElRVUlE
SU8gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DSEVMU0lPPXkKIyBDT05GSUdfQ0hFTFNJ
T19UMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIRUxTSU9fVDMgaXMgbm90IHNldAojIENPTkZJR19D
SEVMU0lPX1Q0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hFTFNJT19UNFZGIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfQ0lTQ089eQojIENPTkZJR19FTklDIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfQ09SVElOQT15CiMgQ09ORklHX0dFTUlOSV9FVEhFUk5FVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NYX0VDQVQgaXMgbm90IHNldAojIENPTkZJR19ETkVUIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfREVDPXkKIyBDT05GSUdfTkVUX1RVTElQIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfRExJTks9eQojIENPTkZJR19ETDJLIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOREFO
Q0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9FTVVMRVg9eQojIENPTkZJR19CRTJORVQg
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9FWkNISVA9eQojIENPTkZJR19FWkNISVBfTlBT
X01BTkFHRU1FTlRfRU5FVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0VYQVI9eQojIENP
TkZJR19TMklPIGlzIG5vdCBzZXQKIyBDT05GSUdfVlhHRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
VkVORE9SX0hQPXkKIyBDT05GSUdfSFAxMDAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9I
VUFXRUk9eQpDT05GSUdfTkVUX1ZFTkRPUl9JTlRFTD15CiMgQ09ORklHX0UxMDAgaXMgbm90IHNl
dApDT05GSUdfRTEwMDA9eQpDT05GSUdfRTEwMDBFPW0KQ09ORklHX0UxMDAwRV9IV1RTPXkKQ09O
RklHX0lHQj1tCkNPTkZJR19JR0JfSFdNT049eQojIENPTkZJR19JR0JWRiBpcyBub3Qgc2V0CiMg
Q09ORklHX0lYR0IgaXMgbm90IHNldApDT05GSUdfSVhHQkU9bQpDT05GSUdfSVhHQkVfSFdNT049
eQojIENPTkZJR19JWEdCRV9EQ0IgaXMgbm90IHNldAojIENPTkZJR19JNDBFIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfSTgyNVhYPXkKIyBDT05GSUdfSk1FIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfTUFSVkVMTD15CiMgQ09ORklHX01WTURJTyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NLR0UgaXMgbm90IHNldAojIENPTkZJR19TS1kyIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfTUVMTEFOT1g9eQojIENPTkZJR19NTFg0X0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYNV9D
T1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYU1dfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01M
WEZXIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTUlDUkVMPXkKIyBDT05GSUdfS1M4ODQy
IGlzIG5vdCBzZXQKIyBDT05GSUdfS1M4ODUxIGlzIG5vdCBzZXQKIyBDT05GSUdfS1M4ODUxX01M
TCBpcyBub3Qgc2V0CiMgQ09ORklHX0tTWjg4NFhfUENJIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfTUlDUk9DSElQPXkKIyBDT05GSUdfRU5DMjhKNjAgaXMgbm90IHNldAojIENPTkZJR19F
TkNYMjRKNjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTEFONzQzWCBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX01ZUkk9eQojIENPTkZJR19NWVJJMTBHRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZF
QUxOWCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX05BVFNFTUk9eQojIENPTkZJR19OQVRT
RU1JIGlzIG5vdCBzZXQKIyBDT05GSUdfTlM4MzgyMCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVO
RE9SX05FVFJPTk9NRT15CkNPTkZJR19ORVRfVkVORE9SX05JPXkKQ09ORklHX05FVF9WRU5ET1Jf
ODM5MD15CiMgQ09ORklHX05FMktfUENJIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTlZJ
RElBPXkKIyBDT05GSUdfRk9SQ0VERVRIIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfT0tJ
PXkKIyBDT05GSUdfRVRIT0MgaXMgbm90IHNldApDT05GSUdfTkVUX1BBQ0tFVF9FTkdJTkU9eQoj
IENPTkZJR19IQU1BQ0hJIGlzIG5vdCBzZXQKIyBDT05GSUdfWUVMTE9XRklOIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfUUxPR0lDPXkKIyBDT05GSUdfUUxBM1hYWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1FMQ05JQyBpcyBub3Qgc2V0CiMgQ09ORklHX1FMR0UgaXMgbm90IHNldAojIENPTkZJ
R19ORVRYRU5fTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfUUVEIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfUVVBTENPTU09eQojIENPTkZJR19RQ0E3MDAwX1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1FDQTcwMDBfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1FDT01fRU1BQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1JNTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUkVBTFRFSz15CiMg
Q09ORklHX0FUUCBpcyBub3Qgc2V0CiMgQ09ORklHXzgxMzlDUCBpcyBub3Qgc2V0CiMgQ09ORklH
XzgxMzlUT08gaXMgbm90IHNldAojIENPTkZJR19SODE2OSBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
VkVORE9SX1JFTkVTQVM9eQpDT05GSUdfTkVUX1ZFTkRPUl9SREM9eQojIENPTkZJR19SNjA0MCBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JPQ0tFUj15CkNPTkZJR19ORVRfVkVORE9SX1NB
TVNVTkc9eQojIENPTkZJR19TWEdCRV9FVEggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9T
RUVRPXkKQ09ORklHX05FVF9WRU5ET1JfU0lMQU49eQojIENPTkZJR19TQzkyMDMxIGlzIG5vdCBz
ZXQKQ09ORklHX05FVF9WRU5ET1JfU0lTPXkKIyBDT05GSUdfU0lTOTAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0lTMTkwIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU09MQVJGTEFSRT15CiMg
Q09ORklHX1NGQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NGQ19GQUxDT04gaXMgbm90IHNldApDT05G
SUdfTkVUX1ZFTkRPUl9TTVNDPXkKIyBDT05GSUdfRVBJQzEwMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NNU0M5MTFYIGlzIG5vdCBzZXQKIyBDT05GSUdfU01TQzk0MjAgaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9TT0NJT05FWFQ9eQpDT05GSUdfTkVUX1ZFTkRPUl9TVE1JQ1JPPXkKIyBDT05G
SUdfU1RNTUFDX0VUSCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NVTj15CiMgQ09ORklH
X0hBUFBZTUVBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NVTkdFTSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NBU1NJTkkgaXMgbm90IHNldAojIENPTkZJR19OSVUgaXMgbm90IHNldApDT05GSUdfTkVUX1ZF
TkRPUl9URUhVVEk9eQojIENPTkZJR19URUhVVEkgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9UST15CiMgQ09ORklHX1RJX0NQU1dfQUxFIGlzIG5vdCBzZXQKIyBDT05GSUdfVExBTiBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1ZJQT15CiMgQ09ORklHX1ZJQV9SSElORSBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJQV9WRUxPQ0lUWSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1dJ
Wk5FVD15CiMgQ09ORklHX1dJWk5FVF9XNTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1dJWk5FVF9X
NTMwMCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NZTk9QU1lTPXkKIyBDT05GSUdfRFdD
X1hMR01BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZEREkgaXMgbm90IHNldAojIENPTkZJR19ISVBQ
SSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQjEwMDAgaXMgbm90IHNldAojIENPTkZJR19NRElP
X0RFVklDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWUxJQiBpcyBub3Qgc2V0CiMgQ09ORklHX01J
Q1JFTF9LUzg5OTVNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BMSVAgaXMgbm90IHNldAojIENPTkZJ
R19QUFAgaXMgbm90IHNldAojIENPTkZJR19TTElQIGlzIG5vdCBzZXQKCiMKIyBIb3N0LXNpZGUg
VVNCIHN1cHBvcnQgaXMgbmVlZGVkIGZvciBVU0IgTmV0d29yayBBZGFwdGVyIHN1cHBvcnQKIwpD
T05GSUdfV0xBTj15CiMgQ09ORklHX1dJUkVMRVNTX1dEUyBpcyBub3Qgc2V0CkNPTkZJR19XTEFO
X1ZFTkRPUl9BRE1URUs9eQpDT05GSUdfV0xBTl9WRU5ET1JfQVRIPXkKIyBDT05GSUdfQVRIX0RF
QlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRINUtfUENJIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5f
VkVORE9SX0FUTUVMPXkKQ09ORklHX1dMQU5fVkVORE9SX0JST0FEQ09NPXkKQ09ORklHX1dMQU5f
VkVORE9SX0NJU0NPPXkKQ09ORklHX1dMQU5fVkVORE9SX0lOVEVMPXkKQ09ORklHX1dMQU5fVkVO
RE9SX0lOVEVSU0lMPXkKIyBDT05GSUdfSE9TVEFQIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJJU001
NCBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9NQVJWRUxMPXkKQ09ORklHX1dMQU5fVkVO
RE9SX01FRElBVEVLPXkKQ09ORklHX1dMQU5fVkVORE9SX1JBTElOSz15CkNPTkZJR19XTEFOX1ZF
TkRPUl9SRUFMVEVLPXkKQ09ORklHX1dMQU5fVkVORE9SX1JTST15CkNPTkZJR19XTEFOX1ZFTkRP
Ul9TVD15CkNPTkZJR19XTEFOX1ZFTkRPUl9UST15CkNPTkZJR19XTEFOX1ZFTkRPUl9aWURBUz15
CkNPTkZJR19XTEFOX1ZFTkRPUl9RVUFOVEVOTkE9eQoKIwojIEVuYWJsZSBXaU1BWCAoTmV0d29y
a2luZyBvcHRpb25zKSB0byBzZWUgdGhlIFdpTUFYIGRyaXZlcnMKIwojIENPTkZJR19XQU4gaXMg
bm90IHNldApDT05GSUdfSUVFRTgwMjE1NF9EUklWRVJTPXkKIyBDT05GSUdfVk1YTkVUMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZVSklUU1VfRVMgaXMgbm90IHNldAojIENPTkZJR19USFVOREVSQk9M
VF9ORVQgaXMgbm90IHNldAojIENPTkZJR19ORVRERVZTSU0gaXMgbm90IHNldAojIENPTkZJR19J
U0ROIGlzIG5vdCBzZXQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19JTlBVVD15
CkNPTkZJR19JTlBVVF9MRURTPXkKIyBDT05GSUdfSU5QVVRfRkZfTUVNTEVTUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOUFVUX1BPTExERVYgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9TUEFSU0VL
TUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUFUUklYS01BUCBpcyBub3Qgc2V0CgojCiMg
VXNlcmxhbmQgaW50ZXJmYWNlcwojCiMgQ09ORklHX0lOUFVUX01PVVNFREVWIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5QVVRfSk9ZREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRVZERVYgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9FVkJVRyBpcyBub3Qgc2V0CgojCiMgSW5wdXQgRGV2aWNl
IERyaXZlcnMKIwpDT05GSUdfSU5QVVRfS0VZQk9BUkQ9eQojIENPTkZJR19LRVlCT0FSRF9BREMg
aXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfQURQNTU4OCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0FEUDU1ODkgaXMg
bm90IHNldApDT05GSUdfS0VZQk9BUkRfQVRLQkQ9eQojIENPTkZJR19LRVlCT0FSRF9RVDEwNzAg
aXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9RVDIxNjAgaXMgbm90IHNldAojIENPTkZJR19L
RVlCT0FSRF9ETElOS19ESVI2ODUgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MS0tCRCBp
cyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19LRVlC
T0FSRF9HUElPX1BPTExFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1RDQTY0MTYgaXMg
bm90IHNldAojIENPTkZJR19LRVlCT0FSRF9UQ0E4NDE4IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfTUFUUklYIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTE04MzIzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfS0VZQk9BUkRfTE04MzMzIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRf
TUFYNzM1OSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX01DUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0tFWUJPQVJEX01QUjEyMSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX05FV1RPTiBp
cyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX09QRU5DT1JFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0tFWUJPQVJEX1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9TVE9XQVdBWSBp
cyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1NVTktCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX09NQVA0IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVEMzNTg5WCBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX1RNMl9UT1VDSEtFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX1hUS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQ1JPU19FQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX0NBUDExWFggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9CQ00gaXMgbm90IHNldApDT05GSUdfSU5QVVRfTU9VU0U9eQpDT05GSUdfTU9VU0VfUFMyPXkK
Q09ORklHX01PVVNFX1BTMl9BTFBTPXkKQ09ORklHX01PVVNFX1BTMl9CWUQ9eQpDT05GSUdfTU9V
U0VfUFMyX0xPR0lQUzJQUD15CkNPTkZJR19NT1VTRV9QUzJfU1lOQVBUSUNTPXkKQ09ORklHX01P
VVNFX1BTMl9TWU5BUFRJQ1NfU01CVVM9eQpDT05GSUdfTU9VU0VfUFMyX0NZUFJFU1M9eQpDT05G
SUdfTU9VU0VfUFMyX1RSQUNLUE9JTlQ9eQojIENPTkZJR19NT1VTRV9QUzJfRUxBTlRFQ0ggaXMg
bm90IHNldAojIENPTkZJR19NT1VTRV9QUzJfU0VOVEVMSUMgaXMgbm90IHNldAojIENPTkZJR19N
T1VTRV9QUzJfVE9VQ0hLSVQgaXMgbm90IHNldApDT05GSUdfTU9VU0VfUFMyX0ZPQ0FMVEVDSD15
CiMgQ09ORklHX01PVVNFX1BTMl9WTU1PVVNFIGlzIG5vdCBzZXQKQ09ORklHX01PVVNFX1BTMl9T
TUJVUz15CiMgQ09ORklHX01PVVNFX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX0FQ
UExFVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9CQ001OTc0IGlzIG5vdCBzZXQKIyBD
T05GSUdfTU9VU0VfQ1lBUEEgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9FTEFOX0kyQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01PVVNFX1ZTWFhYQUEgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9H
UElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfU1lOQVBUSUNTX0kyQyBpcyBub3Qgc2V0CiMg
Q09ORklHX01PVVNFX1NZTkFQVElDU19VU0IgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9KT1lT
VElDSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RBQkxFVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOUFVUX1RPVUNIU0NSRUVOIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUlTQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1JNSTRfQ09SRSBpcyBub3Qgc2V0CgojCiMgSGFyZHdhcmUgSS9PIHBvcnRz
CiMKQ09ORklHX1NFUklPPXkKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9QQ19TRVJJTz15CkNPTkZJ
R19TRVJJT19JODA0Mj15CkNPTkZJR19TRVJJT19TRVJQT1JUPXkKQ09ORklHX1NFUklPX0NUODJD
NzEwPW0KQ09ORklHX1NFUklPX1BBUktCRD1tCiMgQ09ORklHX1NFUklPX1BDSVBTMiBpcyBub3Qg
c2V0CkNPTkZJR19TRVJJT19MSUJQUzI9eQpDT05GSUdfU0VSSU9fUkFXPXkKQ09ORklHX1NFUklP
X0FMVEVSQV9QUzI9eQpDT05GSUdfU0VSSU9fUFMyTVVMVD15CkNPTkZJR19TRVJJT19BUkNfUFMy
PXkKQ09ORklHX1NFUklPX0FQQlBTMj1tCkNPTkZJR19TRVJJT19HUElPX1BTMj15CkNPTkZJR19V
U0VSSU89eQpDT05GSUdfR0FNRVBPUlQ9eQpDT05GSUdfR0FNRVBPUlRfTlM1NTg9bQpDT05GSUdf
R0FNRVBPUlRfTDQ9bQpDT05GSUdfR0FNRVBPUlRfRU1VMTBLMT15CkNPTkZJR19HQU1FUE9SVF9G
TTgwMT1tCgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKIyBDT05GSUdfVlQg
aXMgbm90IHNldApDT05GSUdfVU5JWDk4X1BUWVM9eQojIENPTkZJR19MRUdBQ1lfUFRZUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFUklBTF9OT05TVEFOREFSRCBpcyBub3Qgc2V0CkNPTkZJR19OT1pP
TUk9eQpDT05GSUdfTl9HU009bQojIENPTkZJR19UUkFDRV9ST1VURVIgaXMgbm90IHNldApDT05G
SUdfVFJBQ0VfU0lOSz15CiMgQ09ORklHX0RFVk1FTSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFVktN
RU0gaXMgbm90IHNldAoKIwojIFNlcmlhbCBkcml2ZXJzCiMKQ09ORklHX1NFUklBTF9FQVJMWUNP
Tj15CkNPTkZJR19TRVJJQUxfODI1MD15CkNPTkZJR19TRVJJQUxfODI1MF9ERVBSRUNBVEVEX09Q
VElPTlM9eQpDT05GSUdfU0VSSUFMXzgyNTBfUE5QPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfRklO
VEVLIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0NPTlNPTEU9eQojIENPTkZJR19TRVJJ
QUxfODI1MF9ETUEgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9QQ0kgaXMgbm90IHNl
dApDT05GSUdfU0VSSUFMXzgyNTBfTUVOX01DQj1tCkNPTkZJR19TRVJJQUxfODI1MF9OUl9VQVJU
Uz00CkNPTkZJR19TRVJJQUxfODI1MF9SVU5USU1FX1VBUlRTPTQKQ09ORklHX1NFUklBTF84MjUw
X0VYVEVOREVEPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfTUFOWV9QT1JUUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFUklBTF84MjUwX0FTUEVFRF9WVUFSVCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxf
ODI1MF9TSEFSRV9JUlE9eQpDT05GSUdfU0VSSUFMXzgyNTBfREVURUNUX0lSUT15CkNPTkZJR19T
RVJJQUxfODI1MF9SU0E9eQpDT05GSUdfU0VSSUFMXzgyNTBfRFc9eQpDT05GSUdfU0VSSUFMXzgy
NTBfUlQyODhYPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfTFBTUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFUklBTF84MjUwX01JRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX01PWEEgaXMg
bm90IHNldApDT05GSUdfU0VSSUFMX09GX1BMQVRGT1JNPW0KCiMKIyBOb24tODI1MCBzZXJpYWwg
cG9ydCBzdXBwb3J0CiMKQ09ORklHX1NFUklBTF9NQVgzMTAwPXkKQ09ORklHX1NFUklBTF9NQVgz
MTBYPXkKQ09ORklHX1NFUklBTF9VQVJUTElURT15CkNPTkZJR19TRVJJQUxfVUFSVExJVEVfQ09O
U09MRT15CkNPTkZJR19TRVJJQUxfVUFSVExJVEVfTlJfVUFSVFM9MQpDT05GSUdfU0VSSUFMX0NP
UkU9eQpDT05GSUdfU0VSSUFMX0NPUkVfQ09OU09MRT15CiMgQ09ORklHX1NFUklBTF9KU00gaXMg
bm90IHNldApDT05GSUdfU0VSSUFMX1NDQ05YUD15CiMgQ09ORklHX1NFUklBTF9TQ0NOWFBfQ09O
U09MRSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfU0MxNklTN1hYX0NPUkU9eQpDT05GSUdfU0VS
SUFMX1NDMTZJUzdYWD15CkNPTkZJR19TRVJJQUxfU0MxNklTN1hYX0kyQz15CkNPTkZJR19TRVJJ
QUxfU0MxNklTN1hYX1NQST15CkNPTkZJR19TRVJJQUxfQUxURVJBX0pUQUdVQVJUPW0KQ09ORklH
X1NFUklBTF9BTFRFUkFfVUFSVD1tCkNPTkZJR19TRVJJQUxfQUxURVJBX1VBUlRfTUFYUE9SVFM9
NApDT05GSUdfU0VSSUFMX0FMVEVSQV9VQVJUX0JBVURSQVRFPTExNTIwMApDT05GSUdfU0VSSUFM
X0lGWDZYNjA9bQpDT05GSUdfU0VSSUFMX1hJTElOWF9QU19VQVJUPW0KIyBDT05GSUdfU0VSSUFM
X0FSQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9SUDIgaXMgbm90IHNldApDT05GSUdfU0VS
SUFMX0ZTTF9MUFVBUlQ9eQpDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlRfQ09OU09MRT15CiMgQ09O
RklHX1NFUklBTF9DT05FWEFOVF9ESUdJQ09MT1IgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxf
TUVOX1oxMzUgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0RFVl9CVVM9bQpDT05GSUdfVFRZX1BS
SU5USz1tCkNPTkZJR19QUklOVEVSPXkKIyBDT05GSUdfTFBfQ09OU09MRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BQREVWIGlzIG5vdCBzZXQKQ09ORklHX0hWQ19EUklWRVI9eQpDT05GSUdfVklSVElP
X0NPTlNPTEU9eQojIENPTkZJR19JUE1JX0hBTkRMRVIgaXMgbm90IHNldAojIENPTkZJR19IV19S
QU5ET00gaXMgbm90IHNldApDT05GSUdfTlZSQU09bQojIENPTkZJR19SMzk2NCBpcyBub3Qgc2V0
CkNPTkZJR19BUFBMSUNPTT1tCkNPTkZJR19NV0FWRT15CiMgQ09ORklHX0hQRVQgaXMgbm90IHNl
dAojIENPTkZJR19IQU5HQ0hFQ0tfVElNRVIgaXMgbm90IHNldApDT05GSUdfVENHX1RQTT15CkNP
TkZJR19UQ0dfVElTX0NPUkU9eQpDT05GSUdfVENHX1RJUz15CkNPTkZJR19UQ0dfVElTX1NQST15
CiMgQ09ORklHX1RDR19USVNfSTJDX0FUTUVMIGlzIG5vdCBzZXQKIyBDT05GSUdfVENHX1RJU19J
MkNfSU5GSU5FT04gaXMgbm90IHNldApDT05GSUdfVENHX1RJU19JMkNfTlVWT1RPTj15CiMgQ09O
RklHX1RDR19OU0MgaXMgbm90IHNldAojIENPTkZJR19UQ0dfQVRNRUwgaXMgbm90IHNldAojIENP
TkZJR19UQ0dfSU5GSU5FT04gaXMgbm90IHNldAojIENPTkZJR19UQ0dfQ1JCIGlzIG5vdCBzZXQK
IyBDT05GSUdfVENHX1ZUUE1fUFJPWFkgaXMgbm90IHNldApDT05GSUdfVENHX1RJU19TVDMzWlAy
ND1tCkNPTkZJR19UQ0dfVElTX1NUMzNaUDI0X0kyQz1tCiMgQ09ORklHX1RDR19USVNfU1QzM1pQ
MjRfU1BJIGlzIG5vdCBzZXQKQ09ORklHX1RFTENMT0NLPW0KIyBDT05GSUdfREVWUE9SVCBpcyBu
b3Qgc2V0CkNPTkZJR19YSUxMWUJVUz1tCiMgQ09ORklHX1hJTExZQlVTX09GIGlzIG5vdCBzZXQK
CiMKIyBJMkMgc3VwcG9ydAojCkNPTkZJR19JMkM9eQpDT05GSUdfQUNQSV9JMkNfT1BSRUdJT049
eQpDT05GSUdfSTJDX0JPQVJESU5GTz15CkNPTkZJR19JMkNfQ09NUEFUPXkKQ09ORklHX0kyQ19D
SEFSREVWPXkKQ09ORklHX0kyQ19NVVg9eQoKIwojIE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBv
cnQKIwpDT05GSUdfSTJDX0FSQl9HUElPX0NIQUxMRU5HRT15CkNPTkZJR19JMkNfTVVYX0dQSU89
eQpDT05GSUdfSTJDX01VWF9HUE1VWD15CiMgQ09ORklHX0kyQ19NVVhfTFRDNDMwNiBpcyBub3Qg
c2V0CkNPTkZJR19JMkNfTVVYX1BDQTk1NDE9bQpDT05GSUdfSTJDX01VWF9QQ0E5NTR4PXkKQ09O
RklHX0kyQ19NVVhfUkVHPXkKQ09ORklHX0kyQ19NVVhfTUxYQ1BMRD15CkNPTkZJR19JMkNfSEVM
UEVSX0FVVE89eQpDT05GSUdfSTJDX1NNQlVTPW0KQ09ORklHX0kyQ19BTEdPQklUPXkKQ09ORklH
X0kyQ19BTEdPUENBPXkKCiMKIyBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKIwoKIwojIFBDIFNN
QnVzIGhvc3QgY29udHJvbGxlciBkcml2ZXJzCiMKQ09ORklHX0kyQ19BTEkxNTM1PXkKIyBDT05G
SUdfSTJDX0FMSTE1NjMgaXMgbm90IHNldApDT05GSUdfSTJDX0FMSTE1WDM9eQpDT05GSUdfSTJD
X0FNRDc1Nj15CkNPTkZJR19JMkNfQU1ENzU2X1M0ODgyPW0KQ09ORklHX0kyQ19BTUQ4MTExPXkK
Q09ORklHX0kyQ19JODAxPW0KIyBDT05GSUdfSTJDX0lTQ0ggaXMgbm90IHNldApDT05GSUdfSTJD
X0lTTVQ9bQpDT05GSUdfSTJDX1BJSVg0PXkKQ09ORklHX0kyQ19ORk9SQ0UyPXkKQ09ORklHX0ky
Q19ORk9SQ0UyX1M0OTg1PXkKIyBDT05GSUdfSTJDX1NJUzU1OTUgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfU0lTNjMwIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19TSVM5Nlg9eQojIENPTkZJR19JMkNf
VklBIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19WSUFQUk89bQoKIwojIEFDUEkgZHJpdmVycwojCiMg
Q09ORklHX0kyQ19TQ01JIGlzIG5vdCBzZXQKCiMKIyBJMkMgc3lzdGVtIGJ1cyBkcml2ZXJzICht
b3N0bHkgZW1iZWRkZWQgLyBzeXN0ZW0tb24tY2hpcCkKIwpDT05GSUdfSTJDX0NCVVNfR1BJTz15
CkNPTkZJR19JMkNfREVTSUdOV0FSRV9DT1JFPXkKQ09ORklHX0kyQ19ERVNJR05XQVJFX1BMQVRG
T1JNPXkKIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfU0xBVkUgaXMgbm90IHNldApDT05GSUdfSTJD
X0RFU0lHTldBUkVfUENJPW0KQ09ORklHX0kyQ19FTUVWMj15CkNPTkZJR19JMkNfR1BJTz15CiMg
Q09ORklHX0kyQ19HUElPX0ZBVUxUX0lOSkVDVE9SIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19LRU1Q
TEQ9bQpDT05GSUdfSTJDX09DT1JFUz15CkNPTkZJR19JMkNfUENBX1BMQVRGT1JNPXkKIyBDT05G
SUdfSTJDX1JLM1ggaXMgbm90IHNldApDT05GSUdfSTJDX1NJTVRFQz1tCkNPTkZJR19JMkNfWElM
SU5YPW0KCiMKIyBFeHRlcm5hbCBJMkMvU01CdXMgYWRhcHRlciBkcml2ZXJzCiMKQ09ORklHX0ky
Q19QQVJQT1JUPW0KIyBDT05GSUdfSTJDX1BBUlBPUlRfTElHSFQgaXMgbm90IHNldApDT05GSUdf
STJDX1RBT1NfRVZNPXkKCiMKIyBPdGhlciBJMkMvU01CdXMgYnVzIGRyaXZlcnMKIwpDT05GSUdf
STJDX01MWENQTEQ9eQojIENPTkZJR19JMkNfQ1JPU19FQ19UVU5ORUwgaXMgbm90IHNldAojIENP
TkZJR19JMkNfU1RVQiBpcyBub3Qgc2V0CkNPTkZJR19JMkNfU0xBVkU9eQpDT05GSUdfSTJDX1NM
QVZFX0VFUFJPTT15CiMgQ09ORklHX0kyQ19ERUJVR19DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX0RFQlVHX0FMR08gaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQlVTIGlzIG5vdCBz
ZXQKQ09ORklHX1NQST15CiMgQ09ORklHX1NQSV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TUElf
TUFTVEVSPXkKCiMKIyBTUEkgTWFzdGVyIENvbnRyb2xsZXIgRHJpdmVycwojCkNPTkZJR19TUElf
QUxURVJBPXkKQ09ORklHX1NQSV9BWElfU1BJX0VOR0lORT1tCkNPTkZJR19TUElfQklUQkFORz15
CiMgQ09ORklHX1NQSV9CVVRURVJGTFkgaXMgbm90IHNldApDT05GSUdfU1BJX0NBREVOQ0U9eQpD
T05GSUdfU1BJX0RFU0lHTldBUkU9bQpDT05GSUdfU1BJX0RXX1BDST1tCiMgQ09ORklHX1NQSV9E
V19NSURfRE1BIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9EV19NTUlPPW0KIyBDT05GSUdfU1BJX0dQ
SU8gaXMgbm90IHNldApDT05GSUdfU1BJX0xNNzBfTExQPXkKIyBDT05GSUdfU1BJX0ZTTF9TUEkg
aXMgbm90IHNldApDT05GSUdfU1BJX09DX1RJTlk9bQpDT05GSUdfU1BJX1BYQTJYWD15CkNPTkZJ
R19TUElfUFhBMlhYX1BDST15CkNPTkZJR19TUElfUk9DS0NISVA9bQpDT05GSUdfU1BJX1NDMThJ
UzYwMj15CkNPTkZJR19TUElfWENPTU09bQojIENPTkZJR19TUElfWElMSU5YIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1BJX1pZTlFNUF9HUVNQSSBpcyBub3Qgc2V0CgojCiMgU1BJIFByb3RvY29sIE1h
c3RlcnMKIwpDT05GSUdfU1BJX1NQSURFVj1tCkNPTkZJR19TUElfTE9PUEJBQ0tfVEVTVD1tCkNP
TkZJR19TUElfVExFNjJYMD15CkNPTkZJR19TUElfU0xBVkU9eQpDT05GSUdfU1BJX1NMQVZFX1RJ
TUU9bQpDT05GSUdfU1BJX1NMQVZFX1NZU1RFTV9DT05UUk9MPXkKQ09ORklHX1NQTUk9bQojIENP
TkZJR19IU0kgaXMgbm90IHNldApDT05GSUdfUFBTPXkKIyBDT05GSUdfUFBTX0RFQlVHIGlzIG5v
dCBzZXQKCiMKIyBQUFMgY2xpZW50cyBzdXBwb3J0CiMKQ09ORklHX1BQU19DTElFTlRfS1RJTUVS
PW0KQ09ORklHX1BQU19DTElFTlRfTERJU0M9bQpDT05GSUdfUFBTX0NMSUVOVF9QQVJQT1JUPW0K
Q09ORklHX1BQU19DTElFTlRfR1BJTz1tCgojCiMgUFBTIGdlbmVyYXRvcnMgc3VwcG9ydAojCgoj
CiMgUFRQIGNsb2NrIHN1cHBvcnQKIwoKIwojIEVuYWJsZSBQSFlMSUIgYW5kIE5FVFdPUktfUEhZ
X1RJTUVTVEFNUElORyB0byBzZWUgdGhlIGFkZGl0aW9uYWwgY2xvY2tzLgojCiMgQ09ORklHX1BJ
TkNUUkwgaXMgbm90IHNldApDT05GSUdfR1BJT0xJQj15CkNPTkZJR19PRl9HUElPPXkKQ09ORklH
X0dQSU9fQUNQST15CkNPTkZJR19HUElPTElCX0lSUUNISVA9eQojIENPTkZJR19ERUJVR19HUElP
IGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fU1lTRlM9eQpDT05GSUdfR1BJT19HRU5FUklDPXkKQ09O
RklHX0dQSU9fTUFYNzMwWD1tCgojCiMgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKIwojIENP
TkZJR19HUElPXzc0WFhfTU1JTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQUxURVJBIGlzIG5v
dCBzZXQKIyBDT05GSUdfR1BJT19BTURQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRFdBUEIg
aXMgbm90IHNldApDT05GSUdfR1BJT19GVEdQSU8wMTA9eQpDT05GSUdfR1BJT19HRU5FUklDX1BM
QVRGT1JNPW0KIyBDT05GSUdfR1BJT19HUkdQSU8gaXMgbm90IHNldApDT05GSUdfR1BJT19ITFdE
PXkKQ09ORklHX0dQSU9fSUNIPXkKIyBDT05GSUdfR1BJT19MWU5YUE9JTlQgaXMgbm90IHNldApD
T05GSUdfR1BJT19NQjg2UzdYPW0KQ09ORklHX0dQSU9fTUVOWjEyNz15CkNPTkZJR19HUElPX01P
Q0tVUD15CkNPTkZJR19HUElPX1NZU0NPTj15CiMgQ09ORklHX0dQSU9fVlg4NTUgaXMgbm90IHNl
dAojIENPTkZJR19HUElPX1hJTElOWCBpcyBub3Qgc2V0CgojCiMgUG9ydC1tYXBwZWQgSS9PIEdQ
SU8gZHJpdmVycwojCkNPTkZJR19HUElPXzEwNF9ESU9fNDhFPXkKIyBDT05GSUdfR1BJT18xMDRf
SURJT18xNiBpcyBub3Qgc2V0CkNPTkZJR19HUElPXzEwNF9JRElfNDg9eQpDT05GSUdfR1BJT19G
NzE4OFg9bQojIENPTkZJR19HUElPX0dQSU9fTU0gaXMgbm90IHNldApDT05GSUdfR1BJT19JVDg3
PXkKQ09ORklHX0dQSU9fU0NIPW0KQ09ORklHX0dQSU9fU0NIMzExWD1tCkNPTkZJR19HUElPX1dJ
TkJPTkQ9bQojIENPTkZJR19HUElPX1dTMTZDNDggaXMgbm90IHNldAoKIwojIEkyQyBHUElPIGV4
cGFuZGVycwojCkNPTkZJR19HUElPX0FEUDU1ODg9eQpDT05GSUdfR1BJT19BRFA1NTg4X0lSUT15
CkNPTkZJR19HUElPX0FETlA9bQpDT05GSUdfR1BJT19NQVg3MzAwPW0KQ09ORklHX0dQSU9fTUFY
NzMyWD1tCkNPTkZJR19HUElPX1BDQTk1M1g9bQpDT05GSUdfR1BJT19QQ0Y4NTdYPXkKQ09ORklH
X0dQSU9fVFBJQzI4MTA9bQoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX0FE
UDU1MjA9bQpDT05GSUdfR1BJT19BUklaT05BPW0KQ09ORklHX0dQSU9fQkQ5NTcxTVdWPW0KQ09O
RklHX0dQSU9fSkFOWl9UVEw9bQpDT05GSUdfR1BJT19LRU1QTEQ9bQpDT05GSUdfR1BJT19MUDM5
NDM9eQpDT05GSUdfR1BJT19MUDg3M1g9bQpDT05GSUdfR1BJT19MUDg3NTY1PW0KQ09ORklHX0dQ
SU9fTUFYNzc2MjA9eQpDT05GSUdfR1BJT19QQUxNQVM9eQojIENPTkZJR19HUElPX1JDNVQ1ODMg
aXMgbm90IHNldAojIENPTkZJR19HUElPX1RDMzU4OVggaXMgbm90IHNldApDT05GSUdfR1BJT19U
UFM2NTA4Nj1tCkNPTkZJR19HUElPX1RQUzY1MjE4PXkKQ09ORklHX0dQSU9fVFBTNjU5MTA9eQpD
T05GSUdfR1BJT19VQ0IxNDAwPW0KIyBDT05GSUdfR1BJT19XTTgzMVggaXMgbm90IHNldAoKIwoj
IFBDSSBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX0FNRDgxMTE9eQpDT05GSUdfR1BJT19C
VDhYWD1tCkNPTkZJR19HUElPX01MX0lPSD1tCkNPTkZJR19HUElPX1BDSV9JRElPXzE2PXkKIyBD
T05GSUdfR1BJT19QQ0lFX0lESU9fMjQgaXMgbm90IHNldApDT05GSUdfR1BJT19SREMzMjFYPXkK
IyBDT05GSUdfR1BJT19TT0RBVklMTEUgaXMgbm90IHNldAoKIwojIFNQSSBHUElPIGV4cGFuZGVy
cwojCkNPTkZJR19HUElPXzc0WDE2ND1tCkNPTkZJR19HUElPX01BWDMxOTFYPXkKQ09ORklHX0dQ
SU9fTUFYNzMwMT1tCiMgQ09ORklHX0dQSU9fTUMzMzg4MCBpcyBub3Qgc2V0CkNPTkZJR19HUElP
X1BJU09TUj1tCkNPTkZJR19HUElPX1hSQTE0MDM9eQojIENPTkZJR19XMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BPV0VSX0FWUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUIGlzIG5vdCBz
ZXQKQ09ORklHX1BPV0VSX1NVUFBMWT15CiMgQ09ORklHX1BPV0VSX1NVUFBMWV9ERUJVRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BEQV9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0dFTkVSSUNfQURD
X0JBVFRFUlkgaXMgbm90IHNldAojIENPTkZJR19NQVg4OTI1X1BPV0VSIGlzIG5vdCBzZXQKIyBD
T05GSUdfV004MzFYX0JBQ0tVUCBpcyBub3Qgc2V0CiMgQ09ORklHX1dNODMxWF9QT1dFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFU1RfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZXzg4
UE04NjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9BQ1Q4OTQ1QSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JBVFRFUllfRFMyNzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODEg
aXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RTMjc4MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JB
VFRFUllfTEVHT19FVjMgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1NCUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFOQUdFUl9TQlMgaXMg
bm90IHNldAojIENPTkZJR19CQVRURVJZX0JRMjdYWFggaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX0RBOTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfREE5MTUwIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0hBUkdFUl9BWFAyMFggaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0FYUDIw
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0FYUDIwWF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0FY
UDI4OF9GVUVMX0dBVUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfTUFYMTcwNDIgaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX01BWDg5MDMgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfTUFOQUdF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfTFRDMzY1MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NIQVJHRVJfTUFYMTQ1NzcgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0RFVEVDVE9SX01B
WDE0NjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9NQVg3NzY5MyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NIQVJHRVJfQlEyNDE1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDE5
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDI1NyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NIQVJHRVJfQlEyNDczNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNTg5MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfU01CMzQ3IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdF
Ul9UUFM2NTIxNyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR0FVR0VfTFRDMjk0MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfUlQ1MDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdF
Ul9SVDk0NTUgaXMgbm90IHNldApDT05GSUdfSFdNT049eQpDT05GSUdfSFdNT05fVklEPXkKIyBD
T05GSUdfSFdNT05fREVCVUdfQ0hJUCBpcyBub3Qgc2V0CgojCiMgTmF0aXZlIGRyaXZlcnMKIwoj
IENPTkZJR19TRU5TT1JTX0FENzMxNCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FENzQxND15
CkNPTkZJR19TRU5TT1JTX0FENzQxOD15CkNPTkZJR19TRU5TT1JTX0FETTEwMjE9eQpDT05GSUdf
U0VOU09SU19BRE0xMDI1PXkKQ09ORklHX1NFTlNPUlNfQURNMTAyNj15CkNPTkZJR19TRU5TT1JT
X0FETTEwMjk9eQpDT05GSUdfU0VOU09SU19BRE0xMDMxPXkKQ09ORklHX1NFTlNPUlNfQURNOTI0
MD1tCkNPTkZJR19TRU5TT1JTX0FEVDdYMTA9eQpDT05GSUdfU0VOU09SU19BRFQ3MzEwPXkKQ09O
RklHX1NFTlNPUlNfQURUNzQxMD1tCiMgQ09ORklHX1NFTlNPUlNfQURUNzQxMSBpcyBub3Qgc2V0
CkNPTkZJR19TRU5TT1JTX0FEVDc0NjI9bQojIENPTkZJR19TRU5TT1JTX0FEVDc0NzAgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19BRFQ3NDc1PXkKQ09ORklHX1NFTlNPUlNfQVNDNzYyMT15CkNP
TkZJR19TRU5TT1JTX0s4VEVNUD15CkNPTkZJR19TRU5TT1JTX0sxMFRFTVA9eQojIENPTkZJR19T
RU5TT1JTX0ZBTTE1SF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVBQTEVTTUMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FTQjEwMCBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX0FTUEVFRD1tCkNPTkZJR19TRU5TT1JTX0FUWFAxPW0KIyBDT05GSUdfU0VOU09SU19EUzYy
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRFMxNjIxIGlzIG5vdCBzZXQKQ09ORklHX1NF
TlNPUlNfREVMTF9TTU09eQojIENPTkZJR19TRU5TT1JTX0k1S19BTUIgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19GNzE4MDVGPW0KQ09ORklHX1NFTlNPUlNfRjcxODgyRkc9eQpDT05GSUdfU0VO
U09SU19GNzUzNzVTPW0KIyBDT05GSUdfU0VOU09SU19NQzEzNzgzX0FEQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfRlNDSE1EIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfR0w1MThTTT15
CkNPTkZJR19TRU5TT1JTX0dMNTIwU009bQojIENPTkZJR19TRU5TT1JTX0c3NjBBIGlzIG5vdCBz
ZXQKQ09ORklHX1NFTlNPUlNfRzc2Mj1tCkNPTkZJR19TRU5TT1JTX0dQSU9fRkFOPW0KIyBDT05G
SUdfU0VOU09SU19ISUg2MTMwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfSUlPX0hXTU9OPW0K
Q09ORklHX1NFTlNPUlNfSTU1MDA9bQojIENPTkZJR19TRU5TT1JTX0NPUkVURU1QIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19JVDg3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19KQzQy
IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfUE9XUjEyMjA9eQpDT05GSUdfU0VOU09SU19MSU5F
QUdFPW0KIyBDT05GSUdfU0VOU09SU19MVEMyOTQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19MVEMyOTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MTUxIGlzIG5vdCBzZXQK
Q09ORklHX1NFTlNPUlNfTFRDNDIxNT15CkNPTkZJR19TRU5TT1JTX0xUQzQyMjI9bQpDT05GSUdf
U0VOU09SU19MVEM0MjQ1PW0KQ09ORklHX1NFTlNPUlNfTFRDNDI2MD1tCkNPTkZJR19TRU5TT1JT
X0xUQzQyNjE9bQpDT05GSUdfU0VOU09SU19NQVgxMTExPXkKIyBDT05GSUdfU0VOU09SU19NQVgx
NjA2NSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDE2MTk9bQpDT05GSUdfU0VOU09SU19N
QVgxNjY4PW0KQ09ORklHX1NFTlNPUlNfTUFYMTk3PW0KIyBDT05GSUdfU0VOU09SU19NQVgzMTcy
MiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDY2MjE9eQojIENPTkZJR19TRU5TT1JTX01B
WDY2MzkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2NDIgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX01BWDY2NTAgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19NQVg2Njk3PW0K
Q09ORklHX1NFTlNPUlNfTUFYMzE3OTA9bQojIENPTkZJR19TRU5TT1JTX01DUDMwMjEgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19UQzY1ND1tCkNPTkZJR19TRU5TT1JTX01FTkYyMUJNQ19IV01P
Tj15CkNPTkZJR19TRU5TT1JTX0FEQ1hYPW0KIyBDT05GSUdfU0VOU09SU19MTTYzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19MTTcwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTE03Mz1t
CkNPTkZJR19TRU5TT1JTX0xNNzU9eQojIENPTkZJR19TRU5TT1JTX0xNNzcgaXMgbm90IHNldApD
T05GSUdfU0VOU09SU19MTTc4PXkKQ09ORklHX1NFTlNPUlNfTE04MD15CiMgQ09ORklHX1NFTlNP
UlNfTE04MyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xNODU9bQojIENPTkZJR19TRU5TT1JT
X0xNODcgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MTTkwPXkKQ09ORklHX1NFTlNPUlNfTE05
Mj15CkNPTkZJR19TRU5TT1JTX0xNOTM9eQpDT05GSUdfU0VOU09SU19MTTk1MjM0PW0KQ09ORklH
X1NFTlNPUlNfTE05NTI0MT15CiMgQ09ORklHX1NFTlNPUlNfTE05NTI0NSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfUEM4NzM2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUEM4NzQy
NyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX05UQ19USEVSTUlTVE9SPW0KQ09ORklHX1NFTlNP
UlNfTkNUNjY4Mz1tCiMgQ09ORklHX1NFTlNPUlNfTkNUNjc3NSBpcyBub3Qgc2V0CkNPTkZJR19T
RU5TT1JTX05DVDc4MDI9eQojIENPTkZJR19TRU5TT1JTX05DVDc5MDQgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19QQ0Y4NTkxPW0KIyBDT05GSUdfUE1CVVMgaXMgbm90IHNldApDT05GSUdfU0VO
U09SU19TSFQxNT1tCkNPTkZJR19TRU5TT1JTX1NIVDIxPXkKQ09ORklHX1NFTlNPUlNfU0hUM3g9
eQpDT05GSUdfU0VOU09SU19TSFRDMT15CiMgQ09ORklHX1NFTlNPUlNfU0lTNTU5NSBpcyBub3Qg
c2V0CkNPTkZJR19TRU5TT1JTX0RNRTE3Mzc9eQpDT05GSUdfU0VOU09SU19FTUMxNDAzPXkKIyBD
T05GSUdfU0VOU09SU19FTUMyMTAzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19FTUM2VzIw
MSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1NNU0M0N00xPW0KQ09ORklHX1NFTlNPUlNfU01T
QzQ3TTE5Mj1tCiMgQ09ORklHX1NFTlNPUlNfU01TQzQ3QjM5NyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfU1RUUzc1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01NNjY1IGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfQURDMTI4RDgxOD15CkNPTkZJR19TRU5TT1JTX0FEUzEwMTU9
eQpDT05GSUdfU0VOU09SU19BRFM3ODI4PW0KIyBDT05GSUdfU0VOU09SU19BRFM3ODcxIGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfQU1DNjgyMT1tCiMgQ09ORklHX1NFTlNPUlNfSU5BMjA5IGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JTkEyWFggaXMgbm90IHNldApDT05GSUdfU0VOU09S
U19JTkEzMjIxPW0KQ09ORklHX1NFTlNPUlNfVEM3ND15CiMgQ09ORklHX1NFTlNPUlNfVEhNQzUw
IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVE1QMTAyPW0KQ09ORklHX1NFTlNPUlNfVE1QMTAz
PW0KQ09ORklHX1NFTlNPUlNfVE1QMTA4PXkKQ09ORklHX1NFTlNPUlNfVE1QNDAxPXkKIyBDT05G
SUdfU0VOU09SU19UTVA0MjEgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19WSUFfQ1BVVEVNUD15
CkNPTkZJR19TRU5TT1JTX1ZJQTY4NkE9eQpDT05GSUdfU0VOU09SU19WVDEyMTE9eQpDT05GSUdf
U0VOU09SU19WVDgyMzE9bQpDT05GSUdfU0VOU09SU19XODM3NzNHPXkKQ09ORklHX1NFTlNPUlNf
VzgzNzgxRD1tCiMgQ09ORklHX1NFTlNPUlNfVzgzNzkxRCBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX1c4Mzc5MkQ9eQojIENPTkZJR19TRU5TT1JTX1c4Mzc5MyBpcyBub3Qgc2V0CkNPTkZJR19T
RU5TT1JTX1c4Mzc5NT15CkNPTkZJR19TRU5TT1JTX1c4Mzc5NV9GQU5DVFJMPXkKQ09ORklHX1NF
TlNPUlNfVzgzTDc4NVRTPW0KIyBDT05GSUdfU0VOU09SU19XODNMNzg2TkcgaXMgbm90IHNldApD
T05GSUdfU0VOU09SU19XODM2MjdIRj1tCkNPTkZJR19TRU5TT1JTX1c4MzYyN0VIRj1tCiMgQ09O
RklHX1NFTlNPUlNfV004MzFYIGlzIG5vdCBzZXQKCiMKIyBBQ1BJIGRyaXZlcnMKIwojIENPTkZJ
R19TRU5TT1JTX0FDUElfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FUSzAxMTAg
aXMgbm90IHNldApDT05GSUdfVEhFUk1BTD15CiMgQ09ORklHX1RIRVJNQUxfU1RBVElTVElDUyBp
cyBub3Qgc2V0CkNPTkZJR19USEVSTUFMX0VNRVJHRU5DWV9QT1dFUk9GRl9ERUxBWV9NUz0wCiMg
Q09ORklHX1RIRVJNQUxfSFdNT04gaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX09GIGlzIG5v
dCBzZXQKQ09ORklHX1RIRVJNQUxfV1JJVEFCTEVfVFJJUFM9eQojIENPTkZJR19USEVSTUFMX0RF
RkFVTFRfR09WX1NURVBfV0lTRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfREVGQVVMVF9H
T1ZfRkFJUl9TSEFSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfVVNF
Ul9TUEFDRSBpcyBub3Qgc2V0CkNPTkZJR19USEVSTUFMX0RFRkFVTFRfR09WX1BPV0VSX0FMTE9D
QVRPUj15CiMgQ09ORklHX1RIRVJNQUxfR09WX0ZBSVJfU0hBUkUgaXMgbm90IHNldAojIENPTkZJ
R19USEVSTUFMX0dPVl9TVEVQX1dJU0UgaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX0dPVl9C
QU5HX0JBTkcgaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX0dPVl9VU0VSX1NQQUNFIGlzIG5v
dCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX1BPV0VSX0FMTE9DQVRPUj15CiMgQ09ORklHX0NMT0NL
X1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19ERVZGUkVRX1RIRVJNQUwgaXMgbm90IHNldAoj
IENPTkZJR19USEVSTUFMX0VNVUxBVElPTiBpcyBub3Qgc2V0CkNPTkZJR19NQVg3NzYyMF9USEVS
TUFMPW0KIyBDT05GSUdfSU5URUxfUE9XRVJDTEFNUCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9T
T0NfRFRTX0lPU0ZfQ09SRT1tCkNPTkZJR19JTlRFTF9TT0NfRFRTX1RIRVJNQUw9bQoKIwojIEFD
UEkgSU5UMzQwWCB0aGVybWFsIGRyaXZlcnMKIwojIENPTkZJR19JTlQzNDBYX1RIRVJNQUwgaXMg
bm90IHNldAojIENPTkZJR19JTlRFTF9QQ0hfVEhFUk1BTCBpcyBub3Qgc2V0CkNPTkZJR19RQ09N
X1NQTUlfVEVNUF9BTEFSTT1tCiMgQ09ORklHX0dFTkVSSUNfQURDX1RIRVJNQUwgaXMgbm90IHNl
dAojIENPTkZJR19XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19TU0JfUE9TU0lCTEU9eQpDT05G
SUdfU1NCPXkKQ09ORklHX1NTQl9TUFJPTT15CkNPTkZJR19TU0JfUENJSE9TVF9QT1NTSUJMRT15
CkNPTkZJR19TU0JfUENJSE9TVD15CiMgQ09ORklHX1NTQl9TSUxFTlQgaXMgbm90IHNldAojIENP
TkZJR19TU0JfREVCVUcgaXMgbm90IHNldApDT05GSUdfU1NCX0RSSVZFUl9QQ0lDT1JFX1BPU1NJ
QkxFPXkKQ09ORklHX1NTQl9EUklWRVJfUENJQ09SRT15CkNPTkZJR19TU0JfRFJJVkVSX0dQSU89
eQpDT05GSUdfQkNNQV9QT1NTSUJMRT15CkNPTkZJR19CQ01BPXkKQ09ORklHX0JDTUFfSE9TVF9Q
Q0lfUE9TU0lCTEU9eQpDT05GSUdfQkNNQV9IT1NUX1BDST15CkNPTkZJR19CQ01BX0hPU1RfU09D
PXkKQ09ORklHX0JDTUFfRFJJVkVSX1BDST15CiMgQ09ORklHX0JDTUFfU0ZMQVNIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkNNQV9EUklWRVJfR01BQ19DTU4gaXMgbm90IHNldApDT05GSUdfQkNNQV9E
UklWRVJfR1BJTz15CkNPTkZJR19CQ01BX0RFQlVHPXkKCiMKIyBNdWx0aWZ1bmN0aW9uIGRldmlj
ZSBkcml2ZXJzCiMKQ09ORklHX01GRF9DT1JFPXkKQ09ORklHX01GRF9BQ1Q4OTQ1QT1tCkNPTkZJ
R19NRkRfQVMzNzExPXkKIyBDT05GSUdfTUZEX0FTMzcyMiBpcyBub3Qgc2V0CkNPTkZJR19QTUlD
X0FEUDU1MjA9eQpDT05GSUdfTUZEX0FBVDI4NzBfQ09SRT15CiMgQ09ORklHX01GRF9BVE1FTF9G
TEVYQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FUTUVMX0hMQ0RDIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX0JDTTU5MFhYIGlzIG5vdCBzZXQKQ09ORklHX01GRF9CRDk1NzFNV1Y9eQpDT05G
SUdfTUZEX0FYUDIwWD1tCkNPTkZJR19NRkRfQVhQMjBYX0kyQz1tCkNPTkZJR19NRkRfQ1JPU19F
Qz15CiMgQ09ORklHX01GRF9DUk9TX0VDX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfQ1JPU19F
Q19TUEk9bQpDT05GSUdfTUZEX0NST1NfRUNfQ0hBUkRFVj15CiMgQ09ORklHX1BNSUNfREE5MDNY
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1Ml9TUEkgaXMgbm90IHNldAojIENPTkZJR19N
RkRfREE5MDUyX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNTUgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfREE5MDYyIGlzIG5vdCBzZXQKQ09ORklHX01GRF9EQTkwNjM9bQpDT05GSUdf
TUZEX0RBOTE1MD1tCkNPTkZJR19NRkRfTUMxM1hYWD1tCkNPTkZJR19NRkRfTUMxM1hYWF9TUEk9
bQpDT05GSUdfTUZEX01DMTNYWFhfSTJDPW0KQ09ORklHX01GRF9ISTY0MjFfUE1JQz1tCkNPTkZJ
R19IVENfUEFTSUMzPW0KIyBDT05GSUdfSFRDX0kyQ1BMRCBpcyBub3Qgc2V0CkNPTkZJR19NRkRf
SU5URUxfUVVBUktfSTJDX0dQSU89bQpDT05GSUdfTFBDX0lDSD15CkNPTkZJR19MUENfU0NIPW0K
IyBDT05GSUdfSU5URUxfU09DX1BNSUMgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9TT0NfUE1J
Q19DSFRXQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1NPQ19QTUlDX0NIVERDX1RJIGlzIG5v
dCBzZXQKQ09ORklHX01GRF9JTlRFTF9MUFNTPW0KIyBDT05GSUdfTUZEX0lOVEVMX0xQU1NfQUNQ
SSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfSU5URUxfTFBTU19QQ0k9bQpDT05GSUdfTUZEX0pBTlpf
Q01PRElPPXkKQ09ORklHX01GRF9LRU1QTEQ9bQpDT05GSUdfTUZEXzg4UE04MDA9eQpDT05GSUdf
TUZEXzg4UE04MDU9eQpDT05GSUdfTUZEXzg4UE04NjBYPXkKQ09ORklHX01GRF9NQVgxNDU3Nz15
CkNPTkZJR19NRkRfTUFYNzc2MjA9eQpDT05GSUdfTUZEX01BWDc3Njg2PXkKQ09ORklHX01GRF9N
QVg3NzY5Mz15CiMgQ09ORklHX01GRF9NQVg3Nzg0MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9N
QVg4OTA3IGlzIG5vdCBzZXQKQ09ORklHX01GRF9NQVg4OTI1PXkKIyBDT05GSUdfTUZEX01BWDg5
OTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9NVDYzOTcgaXMgbm90IHNldApDT05GSUdfTUZEX01FTkYyMUJNQz15CkNPTkZJR19FWlhfUENB
UD15CiMgQ09ORklHX01GRF9DUENBUCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SRVRVIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1BDRjUwNjMzIGlzIG5vdCBzZXQKQ09ORklHX1VDQjE0MDBfQ09S
RT1tCkNPTkZJR19NRkRfUkRDMzIxWD15CkNPTkZJR19NRkRfUlQ1MDMzPW0KQ09ORklHX01GRF9S
QzVUNTgzPXkKIyBDT05GSUdfTUZEX1JLODA4IGlzIG5vdCBzZXQKQ09ORklHX01GRF9STjVUNjE4
PXkKIyBDT05GSUdfTUZEX1NFQ19DT1JFIGlzIG5vdCBzZXQKQ09ORklHX01GRF9TSTQ3NlhfQ09S
RT1tCkNPTkZJR19NRkRfU001MDE9eQpDT05GSUdfTUZEX1NNNTAxX0dQSU89eQpDT05GSUdfTUZE
X1NLWTgxNDUyPW0KIyBDT05GSUdfTUZEX1NNU0MgaXMgbm90IHNldAojIENPTkZJR19BQlg1MDBf
Q09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TVE1QRSBpcyBub3Qgc2V0CkNPTkZJR19NRkRf
U1lTQ09OPXkKIyBDT05GSUdfTUZEX1RJX0FNMzM1WF9UU0NBREMgaXMgbm90IHNldApDT05GSUdf
TUZEX0xQMzk0Mz15CkNPTkZJR19NRkRfTFA4Nzg4PXkKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBu
b3Qgc2V0CkNPTkZJR19NRkRfUEFMTUFTPXkKQ09ORklHX1RQUzYxMDVYPXkKIyBDT05GSUdfVFBT
NjUwMTAgaXMgbm90IHNldAojIENPTkZJR19UUFM2NTA3WCBpcyBub3Qgc2V0CkNPTkZJR19NRkRf
VFBTNjUwODY9bQojIENPTkZJR19NRkRfVFBTNjUwOTAgaXMgbm90IHNldApDT05GSUdfTUZEX1RQ
UzY1MjE3PW0KIyBDT05GSUdfTUZEX1RQUzY4NDcwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9USV9M
UDg3M1g9bQpDT05GSUdfTUZEX1RJX0xQODc1NjU9bQpDT05GSUdfTUZEX1RQUzY1MjE4PXkKIyBD
T05GSUdfTUZEX1RQUzY1ODZYIGlzIG5vdCBzZXQKQ09ORklHX01GRF9UUFM2NTkxMD15CiMgQ09O
RklHX01GRF9UUFM2NTkxMl9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTJfU1BJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzgwMDMxIGlzIG5vdCBzZXQKIyBDT05GSUdfVFdM
NDAzMF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfVFdMNjA0MF9DT1JFIGlzIG5vdCBzZXQKQ09O
RklHX01GRF9XTDEyNzNfQ09SRT15CkNPTkZJR19NRkRfTE0zNTMzPXkKQ09ORklHX01GRF9UQzM1
ODlYPXkKQ09ORklHX01GRF9WWDg1NT1tCkNPTkZJR19NRkRfQVJJWk9OQT15CkNPTkZJR19NRkRf
QVJJWk9OQV9JMkM9eQojIENPTkZJR19NRkRfQVJJWk9OQV9TUEkgaXMgbm90IHNldApDT05GSUdf
TUZEX0NTNDdMMjQ9eQojIENPTkZJR19NRkRfV001MTAyIGlzIG5vdCBzZXQKQ09ORklHX01GRF9X
TTUxMTA9eQpDT05GSUdfTUZEX1dNODk5Nz15CiMgQ09ORklHX01GRF9XTTg5OTggaXMgbm90IHNl
dAojIENPTkZJR19NRkRfV004NDAwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9XTTgzMVg9eQojIENP
TkZJR19NRkRfV004MzFYX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfV004MzFYX1NQST15CiMg
Q09ORklHX01GRF9XTTgzNTBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dNODk5NCBpcyBu
b3Qgc2V0CkNPTkZJR19SQVZFX1NQX0NPUkU9bQpDT05GSUdfUkVHVUxBVE9SPXkKIyBDT05GSUdf
UkVHVUxBVE9SX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9GSVhFRF9WT0xUQUdF
PXkKIyBDT05GSUdfUkVHVUxBVE9SX1ZJUlRVQUxfQ09OU1VNRVIgaXMgbm90IHNldAojIENPTkZJ
R19SRUdVTEFUT1JfVVNFUlNQQUNFX0NPTlNVTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SXzg4UEc4NlggaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfODhQTTgwMCBpcyBub3Qg
c2V0CkNPTkZJR19SRUdVTEFUT1JfODhQTTg2MDc9bQojIENPTkZJR19SRUdVTEFUT1JfQUNUODg2
NSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfQUNUODk0NUE9bQpDT05GSUdfUkVHVUxBVE9S
X0FENTM5OD15CkNPTkZJR19SRUdVTEFUT1JfQU5BVE9QPXkKQ09ORklHX1JFR1VMQVRPUl9BQVQy
ODcwPXkKQ09ORklHX1JFR1VMQVRPUl9BUklaT05BX0xETzE9bQpDT05GSUdfUkVHVUxBVE9SX0FS
SVpPTkFfTUlDU1VQUD1tCiMgQ09ORklHX1JFR1VMQVRPUl9BUzM3MTEgaXMgbm90IHNldApDT05G
SUdfUkVHVUxBVE9SX0FYUDIwWD1tCiMgQ09ORklHX1JFR1VMQVRPUl9CRDk1NzFNV1YgaXMgbm90
IHNldApDT05GSUdfUkVHVUxBVE9SX0RBOTA2Mz1tCkNPTkZJR19SRUdVTEFUT1JfREE5MjEwPXkK
IyBDT05GSUdfUkVHVUxBVE9SX0RBOTIxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9G
QU41MzU1NSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfR1BJTz15CkNPTkZJR19SRUdVTEFU
T1JfSEk2NDIxPW0KQ09ORklHX1JFR1VMQVRPUl9ISTY0MjFWNTMwPW0KIyBDT05GSUdfUkVHVUxB
VE9SX0lTTDkzMDUgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfSVNMNjI3MUEgaXMgbm90
IHNldApDT05GSUdfUkVHVUxBVE9SX0xQMzk3MT15CkNPTkZJR19SRUdVTEFUT1JfTFAzOTcyPXkK
Q09ORklHX1JFR1VMQVRPUl9MUDg3Mlg9eQojIENPTkZJR19SRUdVTEFUT1JfTFA4NzNYIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xQODc1NSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFU
T1JfTFA4NzU2NT1tCiMgQ09ORklHX1JFR1VMQVRPUl9MUDg3ODggaXMgbm90IHNldAojIENPTkZJ
R19SRUdVTEFUT1JfTFRDMzU4OSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfTFRDMzY3Nj1t
CkNPTkZJR19SRUdVTEFUT1JfTUFYMTQ1Nzc9bQpDT05GSUdfUkVHVUxBVE9SX01BWDE1ODY9eQpD
T05GSUdfUkVHVUxBVE9SX01BWDc3NjIwPW0KQ09ORklHX1JFR1VMQVRPUl9NQVg4NjQ5PXkKQ09O
RklHX1JFR1VMQVRPUl9NQVg4NjYwPW0KQ09ORklHX1JFR1VMQVRPUl9NQVg4OTI1PW0KQ09ORklH
X1JFR1VMQVRPUl9NQVg4OTUyPXkKQ09ORklHX1JFR1VMQVRPUl9NQVg3NzY4Nj1tCkNPTkZJR19S
RUdVTEFUT1JfTUFYNzc2OTM9bQojIENPTkZJR19SRUdVTEFUT1JfTUFYNzc4MDIgaXMgbm90IHNl
dAojIENPTkZJR19SRUdVTEFUT1JfTUMxMzc4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRP
Ul9NQzEzODkyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NVDYzMTE9bQpDT05GSUdfUkVH
VUxBVE9SX1BBTE1BUz1tCkNPTkZJR19SRUdVTEFUT1JfUENBUD1tCkNPTkZJR19SRUdVTEFUT1Jf
UEZVWkUxMDA9eQpDT05GSUdfUkVHVUxBVE9SX1BWODgwNjA9bQojIENPTkZJR19SRUdVTEFUT1Jf
UFY4ODA4MCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUFY4ODA5MD15CiMgQ09ORklHX1JF
R1VMQVRPUl9RQ09NX1NQTUkgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1JDNVQ1ODM9eQoj
IENPTkZJR19SRUdVTEFUT1JfUk41VDYxOCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUlQ1
MDMzPW0KIyBDT05GSUdfUkVHVUxBVE9SX1NLWTgxNDUyIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VM
QVRPUl9UUFM1MTYzMj15CiMgQ09ORklHX1JFR1VMQVRPUl9UUFM2MTA1WCBpcyBub3Qgc2V0CkNP
TkZJR19SRUdVTEFUT1JfVFBTNjIzNjA9bQojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUwMjMgaXMg
bm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUwN1ggaXMgbm90IHNldAojIENPTkZJR19S
RUdVTEFUT1JfVFBTNjUwODYgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUxMzIg
aXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUyMTcgaXMgbm90IHNldAojIENPTkZJ
R19SRUdVTEFUT1JfVFBTNjUyMTggaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1RQUzY1MjRY
PW0KQ09ORklHX1JFR1VMQVRPUl9UUFM2NTkxMD15CkNPTkZJR19SRUdVTEFUT1JfVkNUUkw9bQpD
T05GSUdfUkVHVUxBVE9SX1dNODMxWD1tCiMgQ09ORklHX1JDX0NPUkUgaXMgbm90IHNldApDT05G
SUdfTUVESUFfU1VQUE9SVD1tCgojCiMgTXVsdGltZWRpYSBjb3JlIHN1cHBvcnQKIwojIENPTkZJ
R19NRURJQV9DQU1FUkFfU1VQUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9BTkFMT0dfVFZf
U1VQUE9SVD15CkNPTkZJR19NRURJQV9ESUdJVEFMX1RWX1NVUFBPUlQ9eQojIENPTkZJR19NRURJ
QV9SQURJT19TVVBQT1JUIGlzIG5vdCBzZXQKQ09ORklHX01FRElBX1NEUl9TVVBQT1JUPXkKQ09O
RklHX01FRElBX0NFQ19TVVBQT1JUPXkKQ09ORklHX01FRElBX0NPTlRST0xMRVI9eQpDT05GSUdf
TUVESUFfQ09OVFJPTExFUl9EVkI9eQpDT05GSUdfVklERU9fREVWPW0KIyBDT05GSUdfVklERU9f
VjRMMl9TVUJERVZfQVBJIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1Y0TDI9bQojIENPTkZJR19W
SURFT19BRFZfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19WSURFT19GSVhFRF9NSU5PUl9SQU5H
RVMgaXMgbm90IHNldApDT05GSUdfVjRMMl9GV05PREU9bQpDT05GSUdfRFZCX0NPUkU9bQpDT05G
SUdfRFZCX01NQVA9eQpDT05GSUdfRFZCX05FVD15CkNPTkZJR19EVkJfTUFYX0FEQVBURVJTPTE2
CkNPTkZJR19EVkJfRFlOQU1JQ19NSU5PUlM9eQpDT05GSUdfRFZCX0RFTVVYX1NFQ1RJT05fTE9T
U19MT0c9eQpDT05GSUdfRFZCX1VMRV9ERUJVRz15CgojCiMgTWVkaWEgZHJpdmVycwojCiMgQ09O
RklHX01FRElBX1BDSV9TVVBQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1BMQVRGT1JNX0RS
SVZFUlMgaXMgbm90IHNldApDT05GSUdfQ0VDX1BMQVRGT1JNX0RSSVZFUlM9eQojIENPTkZJR19T
RFJfUExBVEZPUk1fRFJJVkVSUyBpcyBub3Qgc2V0CgojCiMgU3VwcG9ydGVkIE1NQy9TRElPIGFk
YXB0ZXJzCiMKQ09ORklHX1NNU19TRElPX0RSVj1tCkNPTkZJR19NRURJQV9DT01NT05fT1BUSU9O
Uz15CgojCiMgY29tbW9uIGRyaXZlciBvcHRpb25zCiMKQ09ORklHX1ZJREVPQlVGMl9DT1JFPW0K
Q09ORklHX1ZJREVPQlVGMl9WNEwyPW0KQ09ORklHX1ZJREVPQlVGMl9NRU1PUFM9bQpDT05GSUdf
VklERU9CVUYyX1ZNQUxMT0M9bQpDT05GSUdfU01TX1NJQU5PX01EVFY9bQoKIwojIE1lZGlhIGFu
Y2lsbGFyeSBkcml2ZXJzICh0dW5lcnMsIHNlbnNvcnMsIGkyYywgc3BpLCBmcm9udGVuZHMpCiMK
IyBDT05GSUdfTUVESUFfU1VCRFJWX0FVVE9TRUxFQ1QgaXMgbm90IHNldApDT05GSUdfTUVESUFf
QVRUQUNIPXkKCiMKIyBJMkMgRW5jb2RlcnMsIGRlY29kZXJzLCBzZW5zb3JzIGFuZCBvdGhlciBo
ZWxwZXIgY2hpcHMKIwoKIwojIEF1ZGlvIGRlY29kZXJzLCBwcm9jZXNzb3JzIGFuZCBtaXhlcnMK
IwojIENPTkZJR19WSURFT19UVkFVRElPIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1REQTc0MzI9
bQojIENPTkZJR19WSURFT19UREE5ODQwIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1RFQTY0MTVD
PW0KQ09ORklHX1ZJREVPX1RFQTY0MjA9bQpDT05GSUdfVklERU9fTVNQMzQwMD1tCkNPTkZJR19W
SURFT19DUzMzMDg9bQojIENPTkZJR19WSURFT19DUzUzNDUgaXMgbm90IHNldApDT05GSUdfVklE
RU9fQ1M1M0wzMkE9bQpDT05GSUdfVklERU9fVExWMzIwQUlDMjNCPW0KIyBDT05GSUdfVklERU9f
VURBMTM0MiBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19XTTg3NzU9bQojIENPTkZJR19WSURFT19X
TTg3MzkgaXMgbm90IHNldApDT05GSUdfVklERU9fVlAyN1NNUFg9bQpDT05GSUdfVklERU9fU09O
WV9CVEZfTVBYPW0KCiMKIyBSRFMgZGVjb2RlcnMKIwpDT05GSUdfVklERU9fU0FBNjU4OD1tCgoj
CiMgVmlkZW8gZGVjb2RlcnMKIwpDT05GSUdfVklERU9fQURWNzE4Mz1tCiMgQ09ORklHX1ZJREVP
X0JUODE5IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX0JUODU2PW0KQ09ORklHX1ZJREVPX0JUODY2
PW0KIyBDT05GSUdfVklERU9fS1MwMTI3IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTUw4NlY3
NjY3IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQUQ1ODIwIGlzIG5vdCBzZXQKQ09ORklHX1ZJ
REVPX1NBQTcxMTA9bQpDT05GSUdfVklERU9fU0FBNzExWD1tCiMgQ09ORklHX1ZJREVPX1RWUDUx
NFggaXMgbm90IHNldApDT05GSUdfVklERU9fVFZQNTE1MD1tCkNPTkZJR19WSURFT19UVlA3MDAy
PW0KQ09ORklHX1ZJREVPX1RXMjgwND1tCkNPTkZJR19WSURFT19UVzk5MDM9bQojIENPTkZJR19W
SURFT19UVzk5MDYgaXMgbm90IHNldApDT05GSUdfVklERU9fVFc5OTEwPW0KIyBDT05GSUdfVklE
RU9fVlBYMzIyMCBpcyBub3Qgc2V0CgojCiMgVmlkZW8gYW5kIGF1ZGlvIGRlY29kZXJzCiMKQ09O
RklHX1ZJREVPX1NBQTcxN1g9bQpDT05GSUdfVklERU9fQ1gyNTg0MD1tCgojCiMgVmlkZW8gZW5j
b2RlcnMKIwpDT05GSUdfVklERU9fU0FBNzEyNz1tCkNPTkZJR19WSURFT19TQUE3MTg1PW0KIyBD
T05GSUdfVklERU9fQURWNzE3MCBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19BRFY3MTc1PW0KQ09O
RklHX1ZJREVPX0FEVjczNDM9bQpDT05GSUdfVklERU9fQURWNzM5Mz1tCkNPTkZJR19WSURFT19B
Szg4MVg9bQpDT05GSUdfVklERU9fVEhTODIwMD1tCgojCiMgQ2FtZXJhIHNlbnNvciBkZXZpY2Vz
CiMKQ09ORklHX1ZJREVPX01UOU0xMTE9bQoKIwojIEZsYXNoIGRldmljZXMKIwoKIwojIFZpZGVv
IGltcHJvdmVtZW50IGNoaXBzCiMKQ09ORklHX1ZJREVPX1VQRDY0MDMxQT1tCiMgQ09ORklHX1ZJ
REVPX1VQRDY0MDgzIGlzIG5vdCBzZXQKCiMKIyBBdWRpby9WaWRlbyBjb21wcmVzc2lvbiBjaGlw
cwojCkNPTkZJR19WSURFT19TQUE2NzUySFM9bQoKIwojIFNEUiB0dW5lciBjaGlwcwojCkNPTkZJ
R19TRFJfTUFYMjE3NT1tCgojCiMgTWlzY2VsbGFuZW91cyBoZWxwZXIgY2hpcHMKIwpDT05GSUdf
VklERU9fVEhTNzMwMz1tCkNPTkZJR19WSURFT19NNTI3OTA9bQoKIwojIFNlbnNvcnMgdXNlZCBv
biBzb2NfY2FtZXJhIGRyaXZlcgojCgojCiMgU1BJIGhlbHBlciBjaGlwcwojCgojCiMgTWVkaWEg
U1BJIEFkYXB0ZXJzCiMKQ09ORklHX0NYRDI4ODBfU1BJX0RSVj1tCkNPTkZJR19NRURJQV9UVU5F
Uj1tCgojCiMgQ3VzdG9taXplIFRWIHR1bmVycwojCiMgQ09ORklHX01FRElBX1RVTkVSX1NJTVBM
RSBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9UREExODI1MD1tCiMgQ09ORklHX01FRElB
X1RVTkVSX1REQTgyOTAgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9UREE4MjdYIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfVERBMTgyNzEgaXMgbm90IHNldApDT05GSUdf
TUVESUFfVFVORVJfVERBOTg4Nz1tCiMgQ09ORklHX01FRElBX1RVTkVSX1RFQTU3NjEgaXMgbm90
IHNldApDT05GSUdfTUVESUFfVFVORVJfVEVBNTc2Nz1tCkNPTkZJR19NRURJQV9UVU5FUl9NU0kw
MDE9bQojIENPTkZJR19NRURJQV9UVU5FUl9NVDIwWFggaXMgbm90IHNldApDT05GSUdfTUVESUFf
VFVORVJfTVQyMDYwPW0KQ09ORklHX01FRElBX1RVTkVSX01UMjA2Mz1tCiMgQ09ORklHX01FRElB
X1RVTkVSX01UMjI2NiBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1RVTkVSX01UMjEzMSBpcyBu
b3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9RVDEwMTA9bQpDT05GSUdfTUVESUFfVFVORVJfWEMy
MDI4PW0KQ09ORklHX01FRElBX1RVTkVSX1hDNTAwMD1tCiMgQ09ORklHX01FRElBX1RVTkVSX1hD
NDAwMCBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9NWEw1MDA1Uz1tCiMgQ09ORklHX01F
RElBX1RVTkVSX01YTDUwMDdUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfTUM0NFM4
MDMgaXMgbm90IHNldApDT05GSUdfTUVESUFfVFVORVJfTUFYMjE2NT1tCiMgQ09ORklHX01FRElB
X1RVTkVSX1REQTE4MjE4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfRkMwMDExIGlz
IG5vdCBzZXQKQ09ORklHX01FRElBX1RVTkVSX0ZDMDAxMj1tCkNPTkZJR19NRURJQV9UVU5FUl9G
QzAwMTM9bQojIENPTkZJR19NRURJQV9UVU5FUl9UREExODIxMiBpcyBub3Qgc2V0CkNPTkZJR19N
RURJQV9UVU5FUl9FNDAwMD1tCkNPTkZJR19NRURJQV9UVU5FUl9GQzI1ODA9bQpDT05GSUdfTUVE
SUFfVFVORVJfTTg4UlM2MDAwVD1tCiMgQ09ORklHX01FRElBX1RVTkVSX1RVQTkwMDEgaXMgbm90
IHNldApDT05GSUdfTUVESUFfVFVORVJfU0kyMTU3PW0KIyBDT05GSUdfTUVESUFfVFVORVJfSVQ5
MTNYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfUjgyMFQgaXMgbm90IHNldAojIENP
TkZJR19NRURJQV9UVU5FUl9NWEwzMDFSRiBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9R
TTFEMUMwMDQyPW0KCiMKIyBDdXN0b21pc2UgRFZCIEZyb250ZW5kcwojCgojCiMgTXVsdGlzdGFu
ZGFyZCAoc2F0ZWxsaXRlKSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX1NUQjA4OTk9bQpDT05GSUdf
RFZCX1NUQjYxMDA9bQpDT05GSUdfRFZCX1NUVjA5MHg9bQpDT05GSUdfRFZCX1NUVjA5MTA9bQpD
T05GSUdfRFZCX1NUVjYxMTB4PW0KIyBDT05GSUdfRFZCX1NUVjYxMTEgaXMgbm90IHNldApDT05G
SUdfRFZCX01YTDVYWD1tCkNPTkZJR19EVkJfTTg4RFMzMTAzPW0KCiMKIyBNdWx0aXN0YW5kYXJk
IChjYWJsZSArIHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwojIENPTkZJR19EVkJfRFJYSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RWQl9UREExODI3MUMyREQgaXMgbm90IHNldAojIENPTkZJR19EVkJf
U0kyMTY1IGlzIG5vdCBzZXQKQ09ORklHX0RWQl9NTjg4NDcyPW0KQ09ORklHX0RWQl9NTjg4NDcz
PW0KCiMKIyBEVkItUyAoc2F0ZWxsaXRlKSBmcm9udGVuZHMKIwojIENPTkZJR19EVkJfQ1gyNDEx
MCBpcyBub3Qgc2V0CkNPTkZJR19EVkJfQ1gyNDEyMz1tCiMgQ09ORklHX0RWQl9NVDMxMiBpcyBu
b3Qgc2V0CkNPTkZJR19EVkJfWkwxMDAzNj1tCiMgQ09ORklHX0RWQl9aTDEwMDM5IGlzIG5vdCBz
ZXQKQ09ORklHX0RWQl9TNUgxNDIwPW0KQ09ORklHX0RWQl9TVFYwMjg4PW0KQ09ORklHX0RWQl9T
VEI2MDAwPW0KQ09ORklHX0RWQl9TVFYwMjk5PW0KQ09ORklHX0RWQl9TVFY2MTEwPW0KQ09ORklH
X0RWQl9TVFYwOTAwPW0KIyBDT05GSUdfRFZCX1REQTgwODMgaXMgbm90IHNldApDT05GSUdfRFZC
X1REQTEwMDg2PW0KQ09ORklHX0RWQl9UREE4MjYxPW0KQ09ORklHX0RWQl9WRVMxWDkzPW0KQ09O
RklHX0RWQl9UVU5FUl9JVEQxMDAwPW0KIyBDT05GSUdfRFZCX1RVTkVSX0NYMjQxMTMgaXMgbm90
IHNldAojIENPTkZJR19EVkJfVERBODI2WCBpcyBub3Qgc2V0CiMgQ09ORklHX0RWQl9UVUE2MTAw
IGlzIG5vdCBzZXQKQ09ORklHX0RWQl9DWDI0MTE2PW0KQ09ORklHX0RWQl9DWDI0MTE3PW0KQ09O
RklHX0RWQl9DWDI0MTIwPW0KQ09ORklHX0RWQl9TSTIxWFg9bQpDT05GSUdfRFZCX1RTMjAyMD1t
CkNPTkZJR19EVkJfRFMzMDAwPW0KQ09ORklHX0RWQl9NQjg2QTE2PW0KIyBDT05GSUdfRFZCX1RE
QTEwMDcxIGlzIG5vdCBzZXQKCiMKIyBEVkItVCAodGVycmVzdHJpYWwpIGZyb250ZW5kcwojCkNP
TkZJR19EVkJfU1A4ODcwPW0KQ09ORklHX0RWQl9TUDg4N1g9bQpDT05GSUdfRFZCX0NYMjI3MDA9
bQpDT05GSUdfRFZCX0NYMjI3MDI9bQojIENPTkZJR19EVkJfUzVIMTQzMiBpcyBub3Qgc2V0CiMg
Q09ORklHX0RWQl9EUlhEIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9MNjQ3ODE9bQojIENPTkZJR19E
VkJfVERBMTAwNFggaXMgbm90IHNldApDT05GSUdfRFZCX05YVDYwMDA9bQpDT05GSUdfRFZCX01U
MzUyPW0KQ09ORklHX0RWQl9aTDEwMzUzPW0KIyBDT05GSUdfRFZCX0RJQjMwMDBNQiBpcyBub3Qg
c2V0CkNPTkZJR19EVkJfRElCMzAwME1DPW0KQ09ORklHX0RWQl9ESUI3MDAwTT1tCkNPTkZJR19E
VkJfRElCNzAwMFA9bQpDT05GSUdfRFZCX0RJQjkwMDA9bQpDT05GSUdfRFZCX1REQTEwMDQ4PW0K
IyBDT05GSUdfRFZCX0FGOTAxMyBpcyBub3Qgc2V0CkNPTkZJR19EVkJfRUMxMDA9bQojIENPTkZJ
R19EVkJfU1RWMDM2NyBpcyBub3Qgc2V0CkNPTkZJR19EVkJfQ1hEMjgyMFI9bQojIENPTkZJR19E
VkJfQ1hEMjg0MUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfRFZCX1JUTDI4MzAgaXMgbm90IHNldAoj
IENPTkZJR19EVkJfUlRMMjgzMiBpcyBub3Qgc2V0CkNPTkZJR19EVkJfU0kyMTY4PW0KQ09ORklH
X0RWQl9aRDEzMDFfREVNT0Q9bQpDT05GSUdfRFZCX0NYRDI4ODA9bQoKIwojIERWQi1DIChjYWJs
ZSkgZnJvbnRlbmRzCiMKIyBDT05GSUdfRFZCX1ZFUzE4MjAgaXMgbm90IHNldAojIENPTkZJR19E
VkJfVERBMTAwMjEgaXMgbm90IHNldApDT05GSUdfRFZCX1REQTEwMDIzPW0KIyBDT05GSUdfRFZC
X1NUVjAyOTcgaXMgbm90IHNldAoKIwojIEFUU0MgKE5vcnRoIEFtZXJpY2FuL0tvcmVhbiBUZXJy
ZXN0cmlhbC9DYWJsZSBEVFYpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfTlhUMjAwWD1tCkNPTkZJ
R19EVkJfT1I1MTIxMT1tCkNPTkZJR19EVkJfT1I1MTEzMj1tCkNPTkZJR19EVkJfQkNNMzUxMD1t
CkNPTkZJR19EVkJfTEdEVDMzMFg9bQojIENPTkZJR19EVkJfTEdEVDMzMDUgaXMgbm90IHNldApD
T05GSUdfRFZCX0xHRFQzMzA2QT1tCkNPTkZJR19EVkJfTEcyMTYwPW0KQ09ORklHX0RWQl9TNUgx
NDA5PW0KQ09ORklHX0RWQl9BVTg1MjI9bQojIENPTkZJR19EVkJfQVU4NTIyX0RUViBpcyBub3Qg
c2V0CkNPTkZJR19EVkJfQVU4NTIyX1Y0TD1tCiMgQ09ORklHX0RWQl9TNUgxNDExIGlzIG5vdCBz
ZXQKCiMKIyBJU0RCLVQgKHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX1M5MjE9
bQpDT05GSUdfRFZCX0RJQjgwMDA9bQpDT05GSUdfRFZCX01CODZBMjBTPW0KCiMKIyBJU0RCLVMg
KHNhdGVsbGl0ZSkgJiBJU0RCLVQgKHRlcnJlc3RyaWFsKSBmcm9udGVuZHMKIwojIENPTkZJR19E
VkJfVEM5MDUyMiBpcyBub3Qgc2V0CgojCiMgRGlnaXRhbCB0ZXJyZXN0cmlhbCBvbmx5IHR1bmVy
cy9QTEwKIwojIENPTkZJR19EVkJfUExMIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9UVU5FUl9ESUIw
MDcwPW0KQ09ORklHX0RWQl9UVU5FUl9ESUIwMDkwPW0KCiMKIyBTRUMgY29udHJvbCBkZXZpY2Vz
IGZvciBEVkItUwojCkNPTkZJR19EVkJfRFJYMzlYWUo9bQojIENPTkZJR19EVkJfTE5CSDI1IGlz
IG5vdCBzZXQKQ09ORklHX0RWQl9MTkJQMjE9bQpDT05GSUdfRFZCX0xOQlAyMj1tCiMgQ09ORklH
X0RWQl9JU0w2NDA1IGlzIG5vdCBzZXQKQ09ORklHX0RWQl9JU0w2NDIxPW0KIyBDT05GSUdfRFZC
X0lTTDY0MjMgaXMgbm90IHNldAojIENPTkZJR19EVkJfQTgyOTMgaXMgbm90IHNldAojIENPTkZJ
R19EVkJfTEdTOEdMNSBpcyBub3Qgc2V0CkNPTkZJR19EVkJfTEdTOEdYWD1tCkNPTkZJR19EVkJf
QVRCTTg4MzA9bQpDT05GSUdfRFZCX1REQTY2NXg9bQojIENPTkZJR19EVkJfSVgyNTA1ViBpcyBu
b3Qgc2V0CkNPTkZJR19EVkJfTTg4UlMyMDAwPW0KIyBDT05GSUdfRFZCX0FGOTAzMyBpcyBub3Qg
c2V0CkNPTkZJR19EVkJfSE9SVVMzQT1tCkNPTkZJR19EVkJfQVNDT1QyRT1tCiMgQ09ORklHX0RW
Ql9IRUxFTkUgaXMgbm90IHNldAoKIwojIENvbW1vbiBJbnRlcmZhY2UgKEVONTAyMjEpIGNvbnRy
b2xsZXIgZHJpdmVycwojCkNPTkZJR19EVkJfQ1hEMjA5OT1tCiMgQ09ORklHX0RWQl9TUDIgaXMg
bm90IHNldAoKIwojIFRvb2xzIHRvIGRldmVsb3AgbmV3IGZyb250ZW5kcwojCkNPTkZJR19EVkJf
RFVNTVlfRkU9bQoKIwojIEdyYXBoaWNzIHN1cHBvcnQKIwpDT05GSUdfQUdQPW0KQ09ORklHX0FH
UF9BTUQ2ND1tCkNPTkZJR19BR1BfSU5URUw9bQpDT05GSUdfQUdQX1NJUz1tCkNPTkZJR19BR1Bf
VklBPW0KQ09ORklHX0lOVEVMX0dUVD1tCkNPTkZJR19WR0FfQVJCPXkKQ09ORklHX1ZHQV9BUkJf
TUFYX0dQVVM9MTYKIyBDT05GSUdfVkdBX1NXSVRDSEVST08gaXMgbm90IHNldAojIENPTkZJR19E
Uk0gaXMgbm90IHNldAoKIwojIEFDUCAoQXVkaW8gQ29Qcm9jZXNzb3IpIENvbmZpZ3VyYXRpb24K
IwoKIwojIEFNRCBMaWJyYXJ5IHJvdXRpbmVzCiMKCiMKIyBGcmFtZSBidWZmZXIgRGV2aWNlcwoj
CkNPTkZJR19GQj15CiMgQ09ORklHX0ZJUk1XQVJFX0VESUQgaXMgbm90IHNldApDT05GSUdfRkJf
Q01ETElORT15CkNPTkZJR19GQl9OT1RJRlk9eQpDT05GSUdfRkJfRERDPXkKQ09ORklHX0ZCX0NG
Ql9GSUxMUkVDVD15CkNPTkZJR19GQl9DRkJfQ09QWUFSRUE9eQpDT05GSUdfRkJfQ0ZCX0lNQUdF
QkxJVD15CkNPTkZJR19GQl9TWVNfRklMTFJFQ1Q9eQpDT05GSUdfRkJfU1lTX0NPUFlBUkVBPXkK
Q09ORklHX0ZCX1NZU19JTUFHRUJMSVQ9eQojIENPTkZJR19GQl9GT1JFSUdOX0VORElBTiBpcyBu
b3Qgc2V0CkNPTkZJR19GQl9TWVNfRk9QUz15CkNPTkZJR19GQl9ERUZFUlJFRF9JTz15CkNPTkZJ
R19GQl9IRUNVQkE9bQpDT05GSUdfRkJfU1ZHQUxJQj1tCkNPTkZJR19GQl9CQUNLTElHSFQ9eQpD
T05GSUdfRkJfTU9ERV9IRUxQRVJTPXkKQ09ORklHX0ZCX1RJTEVCTElUVElORz15CgojCiMgRnJh
bWUgYnVmZmVyIGhhcmR3YXJlIGRyaXZlcnMKIwpDT05GSUdfRkJfQ0lSUlVTPXkKQ09ORklHX0ZC
X1BNMj15CiMgQ09ORklHX0ZCX1BNMl9GSUZPX0RJU0NPTk5FQ1QgaXMgbm90IHNldApDT05GSUdf
RkJfQ1lCRVIyMDAwPXkKQ09ORklHX0ZCX0NZQkVSMjAwMF9EREM9eQojIENPTkZJR19GQl9BUkMg
aXMgbm90IHNldAojIENPTkZJR19GQl9BU0lMSUFOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0lN
U1RUIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVkdBMTYgaXMgbm90IHNldAojIENPTkZJR19GQl9V
VkVTQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZFU0EgaXMgbm90IHNldApDT05GSUdfRkJfTjQx
MT1tCiMgQ09ORklHX0ZCX0hHQSBpcyBub3Qgc2V0CkNPTkZJR19GQl9PUEVOQ09SRVM9bQpDT05G
SUdfRkJfUzFEMTNYWFg9eQojIENPTkZJR19GQl9OVklESUEgaXMgbm90IHNldApDT05GSUdfRkJf
UklWQT1tCiMgQ09ORklHX0ZCX1JJVkFfSTJDIGlzIG5vdCBzZXQKQ09ORklHX0ZCX1JJVkFfREVC
VUc9eQojIENPTkZJR19GQl9SSVZBX0JBQ0tMSUdIVCBpcyBub3Qgc2V0CkNPTkZJR19GQl9JNzQw
PXkKQ09ORklHX0ZCX0xFODA1Nzg9eQojIENPTkZJR19GQl9DQVJJTExPX1JBTkNIIGlzIG5vdCBz
ZXQKQ09ORklHX0ZCX0lOVEVMPW0KIyBDT05GSUdfRkJfSU5URUxfREVCVUcgaXMgbm90IHNldApD
T05GSUdfRkJfSU5URUxfSTJDPXkKQ09ORklHX0ZCX01BVFJPWD15CkNPTkZJR19GQl9NQVRST1hf
TUlMTEVOSVVNPXkKIyBDT05GSUdfRkJfTUFUUk9YX01ZU1RJUVVFIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfTUFUUk9YX0cgaXMgbm90IHNldApDT05GSUdfRkJfTUFUUk9YX0kyQz15CiMgQ09ORklH
X0ZCX1JBREVPTiBpcyBub3Qgc2V0CkNPTkZJR19GQl9BVFkxMjg9bQpDT05GSUdfRkJfQVRZMTI4
X0JBQ0tMSUdIVD15CkNPTkZJR19GQl9BVFk9eQojIENPTkZJR19GQl9BVFlfQ1QgaXMgbm90IHNl
dApDT05GSUdfRkJfQVRZX0dYPXkKQ09ORklHX0ZCX0FUWV9CQUNLTElHSFQ9eQojIENPTkZJR19G
Ql9TMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NBVkFHRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X1NJUyBpcyBub3Qgc2V0CkNPTkZJR19GQl9WSUE9bQojIENPTkZJR19GQl9WSUFfRElSRUNUX1BS
T0NGUyBpcyBub3Qgc2V0CkNPTkZJR19GQl9WSUFfWF9DT01QQVRJQklMSVRZPXkKIyBDT05GSUdf
RkJfTkVPTUFHSUMgaXMgbm90IHNldAojIENPTkZJR19GQl9LWVJPIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfM0RGWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZPT0RPTzEgaXMgbm90IHNldApDT05G
SUdfRkJfVlQ4NjIzPW0KQ09ORklHX0ZCX1RSSURFTlQ9bQojIENPTkZJR19GQl9BUksgaXMgbm90
IHNldApDT05GSUdfRkJfUE0zPW0KQ09ORklHX0ZCX0NBUk1JTkU9eQojIENPTkZJR19GQl9DQVJN
SU5FX0RSQU1fRVZBTCBpcyBub3Qgc2V0CkNPTkZJR19DQVJNSU5FX0RSQU1fQ1VTVE9NPXkKIyBD
T05GSUdfRkJfU001MDEgaXMgbm90IHNldApDT05GSUdfRkJfSUJNX0dYVDQ1MDA9bQpDT05GSUdf
RkJfVklSVFVBTD1tCkNPTkZJR19GQl9NRVRST05PTUU9eQojIENPTkZJR19GQl9NQjg2MlhYIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfQlJPQURTSEVFVCBpcyBub3Qgc2V0CkNPTkZJR19GQl9BVU9f
SzE5MFg9bQpDT05GSUdfRkJfQVVPX0sxOTAwPW0KIyBDT05GSUdfRkJfQVVPX0sxOTAxIGlzIG5v
dCBzZXQKQ09ORklHX0ZCX1NJTVBMRT15CiMgQ09ORklHX0ZCX1NTRDEzMDcgaXMgbm90IHNldApD
T05GSUdfRkJfU003MTI9bQpDT05GSUdfQkFDS0xJR0hUX0xDRF9TVVBQT1JUPXkKQ09ORklHX0xD
RF9DTEFTU19ERVZJQ0U9eQojIENPTkZJR19MQ0RfTDRGMDAyNDJUMDMgaXMgbm90IHNldApDT05G
SUdfTENEX0xNUzI4M0dGMDU9eQojIENPTkZJR19MQ0RfTFRWMzUwUVYgaXMgbm90IHNldAojIENP
TkZJR19MQ0RfSUxJOTIyWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9JTEk5MzIwIGlzIG5vdCBz
ZXQKQ09ORklHX0xDRF9URE8yNE09bQojIENPTkZJR19MQ0RfVkdHMjQzMkE0IGlzIG5vdCBzZXQK
Q09ORklHX0xDRF9QTEFURk9STT15CkNPTkZJR19MQ0RfUzZFNjNNMD1tCkNPTkZJR19MQ0RfTEQ5
MDQwPXkKQ09ORklHX0xDRF9BTVMzNjlGRzA2PXkKIyBDT05GSUdfTENEX0xNUzUwMUtGMDMgaXMg
bm90IHNldApDT05GSUdfTENEX0hYODM1Nz15CkNPTkZJR19CQUNLTElHSFRfQ0xBU1NfREVWSUNF
PXkKQ09ORklHX0JBQ0tMSUdIVF9HRU5FUklDPW0KQ09ORklHX0JBQ0tMSUdIVF9MTTM1MzM9bQpD
T05GSUdfQkFDS0xJR0hUX0NBUklMTE9fUkFOQ0g9bQpDT05GSUdfQkFDS0xJR0hUX01BWDg5MjU9
bQojIENPTkZJR19CQUNLTElHSFRfQVBQTEUgaXMgbm90IHNldApDT05GSUdfQkFDS0xJR0hUX1BN
ODk0MV9XTEVEPW0KQ09ORklHX0JBQ0tMSUdIVF9TQUhBUkE9bQpDT05GSUdfQkFDS0xJR0hUX1dN
ODMxWD1tCkNPTkZJR19CQUNLTElHSFRfQURQNTUyMD1tCkNPTkZJR19CQUNLTElHSFRfQURQODg2
MD1tCiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODcwIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdI
VF84OFBNODYwWD15CiMgQ09ORklHX0JBQ0tMSUdIVF9BQVQyODcwIGlzIG5vdCBzZXQKQ09ORklH
X0JBQ0tMSUdIVF9MTTM2Mzk9eQojIENPTkZJR19CQUNLTElHSFRfU0tZODE0NTIgaXMgbm90IHNl
dApDT05GSUdfQkFDS0xJR0hUX1RQUzY1MjE3PW0KQ09ORklHX0JBQ0tMSUdIVF9BUzM3MTE9eQpD
T05GSUdfQkFDS0xJR0hUX0dQSU89eQpDT05GSUdfQkFDS0xJR0hUX0xWNTIwN0xQPW0KQ09ORklH
X0JBQ0tMSUdIVF9CRDYxMDc9bQpDT05GSUdfQkFDS0xJR0hUX0FSQ1hDTk49bQpDT05GSUdfVkdB
U1RBVEU9eQojIENPTkZJR19MT0dPIGlzIG5vdCBzZXQKQ09ORklHX1NPVU5EPW0KQ09ORklHX1NO
RD1tCkNPTkZJR19TTkRfVElNRVI9bQpDT05GSUdfU05EX1BDTT1tCkNPTkZJR19TTkRfRE1BRU5H
SU5FX1BDTT1tCkNPTkZJR19TTkRfSFdERVA9bQpDT05GSUdfU05EX1JBV01JREk9bQpDT05GSUdf
U05EX0pBQ0s9eQpDT05GSUdfU05EX0pBQ0tfSU5QVVRfREVWPXkKIyBDT05GSUdfU05EX09TU0VN
VUwgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENNX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NVUFBPUlRfT0xEX0FQ
SSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfUFJPQ19GUz15CkNPTkZJR19TTkRfVkVSQk9TRV9QUk9D
RlM9eQpDT05GSUdfU05EX1ZFUkJPU0VfUFJJTlRLPXkKIyBDT05GSUdfU05EX0RFQlVHIGlzIG5v
dCBzZXQKQ09ORklHX1NORF9WTUFTVEVSPXkKQ09ORklHX1NORF9ETUFfU0dCVUY9eQojIENPTkZJ
R19TTkRfU0VRVUVOQ0VSIGlzIG5vdCBzZXQKQ09ORklHX1NORF9NUFU0MDFfVUFSVD1tCkNPTkZJ
R19TTkRfT1BMM19MSUI9bQpDT05GSUdfU05EX1ZYX0xJQj1tCkNPTkZJR19TTkRfQUM5N19DT0RF
Qz1tCkNPTkZJR19TTkRfRFJJVkVSUz15CkNPTkZJR19TTkRfRFVNTVk9bQojIENPTkZJR19TTkRf
QUxPT1AgaXMgbm90IHNldApDT05GSUdfU05EX01UUEFWPW0KQ09ORklHX1NORF9NVFM2ND1tCiMg
Q09ORklHX1NORF9TRVJJQUxfVTE2NTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01QVTQwMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9QT1JUTUFOMlg0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0FDOTdfUE9XRVJfU0FWRSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfUENJPXkKIyBDT05GSUdfU05E
X0FEMTg4OSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQVNJSFBJPW0KIyBDT05GSUdfU05EX0FUSUlY
UCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQVRJSVhQX01PREVNPW0KQ09ORklHX1NORF9BVTg4MTA9
bQojIENPTkZJR19TTkRfQVU4ODIwIGlzIG5vdCBzZXQKQ09ORklHX1NORF9BVTg4MzA9bQpDT05G
SUdfU05EX0FXMj1tCkNPTkZJR19TTkRfQlQ4N1g9bQpDT05GSUdfU05EX0JUODdYX09WRVJDTE9D
Sz15CiMgQ09ORklHX1NORF9DQTAxMDYgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ01JUENJIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9PWFlHRU5fTElCPW0KQ09ORklHX1NORF9PWFlHRU49bQpDT05G
SUdfU05EX0NTNDI4MT1tCkNPTkZJR19TTkRfQ1M0NlhYPW0KIyBDT05GSUdfU05EX0NTNDZYWF9O
RVdfRFNQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NUWEZJIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0RBUkxBMjAgaXMgbm90IHNldApDT05GSUdfU05EX0dJTkEyMD1tCiMgQ09ORklHX1NORF9M
QVlMQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RBUkxBMjQgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfR0lOQTI0IGlzIG5vdCBzZXQKQ09ORklHX1NORF9MQVlMQTI0PW0KQ09ORklHX1NORF9N
T05BPW0KQ09ORklHX1NORF9NSUE9bQojIENPTkZJR19TTkRfRUNITzNHIGlzIG5vdCBzZXQKQ09O
RklHX1NORF9JTkRJR089bQojIENPTkZJR19TTkRfSU5ESUdPSU8gaXMgbm90IHNldAojIENPTkZJ
R19TTkRfSU5ESUdPREogaXMgbm90IHNldApDT05GSUdfU05EX0lORElHT0lPWD1tCiMgQ09ORklH
X1NORF9JTkRJR09ESlggaXMgbm90IHNldApDT05GSUdfU05EX0VOUzEzNzA9bQojIENPTkZJR19T
TkRfRU5TMTM3MSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfRk04MDE9bQpDT05GSUdfU05EX0hEU1A9
bQpDT05GSUdfU05EX0hEU1BNPW0KIyBDT05GSUdfU05EX0lDRTE3MjQgaXMgbm90IHNldApDT05G
SUdfU05EX0lOVEVMOFgwPW0KIyBDT05GSUdfU05EX0lOVEVMOFgwTSBpcyBub3Qgc2V0CkNPTkZJ
R19TTkRfS09SRzEyMTI9bQpDT05GSUdfU05EX0xPTEE9bQpDT05GSUdfU05EX0xYNjQ2NEVTPW0K
Q09ORklHX1NORF9NSVhBUlQ9bQpDT05GSUdfU05EX05NMjU2PW0KQ09ORklHX1NORF9QQ1hIUj1t
CiMgQ09ORklHX1NORF9SSVBUSURFIGlzIG5vdCBzZXQKQ09ORklHX1NORF9STUUzMj1tCkNPTkZJ
R19TTkRfUk1FOTY9bQpDT05GSUdfU05EX1JNRTk2NTI9bQojIENPTkZJR19TTkRfVklBODJYWCBp
cyBub3Qgc2V0CkNPTkZJR19TTkRfVklBODJYWF9NT0RFTT1tCkNPTkZJR19TTkRfVklSVFVPU089
bQpDT05GSUdfU05EX1ZYMjIyPW0KQ09ORklHX1NORF9ZTUZQQ0k9bQoKIwojIEhELUF1ZGlvCiMK
Q09ORklHX1NORF9IREE9bQpDT05GSUdfU05EX0hEQV9JTlRFTD1tCiMgQ09ORklHX1NORF9IREFf
SFdERVAgaXMgbm90IHNldApDT05GSUdfU05EX0hEQV9SRUNPTkZJRz15CiMgQ09ORklHX1NORF9I
REFfSU5QVVRfQkVFUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfUEFUQ0hfTE9BREVSIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19SRUFMVEVLIGlzIG5vdCBzZXQKQ09ORklH
X1NORF9IREFfQ09ERUNfQU5BTE9HPW0KQ09ORklHX1NORF9IREFfQ09ERUNfU0lHTUFURUw9bQoj
IENPTkZJR19TTkRfSERBX0NPREVDX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09E
RUNfSERNSSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfSERBX0NPREVDX0NJUlJVUz1tCkNPTkZJR19T
TkRfSERBX0NPREVDX0NPTkVYQU5UPW0KQ09ORklHX1NORF9IREFfQ09ERUNfQ0EwMTEwPW0KIyBD
T05GSUdfU05EX0hEQV9DT0RFQ19DQTAxMzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NP
REVDX0NNRURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfU0kzMDU0IGlzIG5v
dCBzZXQKQ09ORklHX1NORF9IREFfR0VORVJJQz1tCkNPTkZJR19TTkRfSERBX1BPV0VSX1NBVkVf
REVGQVVMVD0wCkNPTkZJR19TTkRfSERBX0NPUkU9bQpDT05GSUdfU05EX0hEQV9QUkVBTExPQ19T
SVpFPTY0CkNPTkZJR19TTkRfU1BJPXkKQ09ORklHX1NORF9TT0M9bQpDT05GSUdfU05EX1NPQ19B
Qzk3X0JVUz15CkNPTkZJR19TTkRfU09DX0dFTkVSSUNfRE1BRU5HSU5FX1BDTT15CkNPTkZJR19T
TkRfU09DX0FNRF9BQ1A9bQpDT05GSUdfU05EX1NPQ19BTURfQ1pfREE3MjE5TVg5ODM1N19NQUNI
PW0KQ09ORklHX1NORF9TT0NfQU1EX0NaX1JUNTY0NV9NQUNIPW0KQ09ORklHX1NORF9BVE1FTF9T
T0M9bQpDT05GSUdfU05EX0RFU0lHTldBUkVfSTJTPW0KQ09ORklHX1NORF9ERVNJR05XQVJFX1BD
TT15CgojCiMgU29DIEF1ZGlvIGZvciBGcmVlc2NhbGUgQ1BVcwojCgojCiMgQ29tbW9uIFNvQyBB
dWRpbyBvcHRpb25zIGZvciBGcmVlc2NhbGUgQ1BVczoKIwpDT05GSUdfU05EX1NPQ19GU0xfQVNS
Qz1tCkNPTkZJR19TTkRfU09DX0ZTTF9TQUk9bQpDT05GSUdfU05EX1NPQ19GU0xfU1NJPW0KQ09O
RklHX1NORF9TT0NfRlNMX1NQRElGPW0KQ09ORklHX1NORF9TT0NfRlNMX0VTQUk9bQpDT05GSUdf
U05EX1NPQ19JTVhfQVVETVVYPW0KQ09ORklHX1NORF9JMlNfSEk2MjEwX0kyUz1tCkNPTkZJR19T
TkRfU09DX0lNRz15CkNPTkZJR19TTkRfU09DX0lNR19JMlNfSU49bQojIENPTkZJR19TTkRfU09D
X0lNR19JMlNfT1VUIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfSU1HX1BBUkFMTEVMX09VVD1t
CiMgQ09ORklHX1NORF9TT0NfSU1HX1NQRElGX0lOIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0Nf
SU1HX1NQRElGX09VVD1tCkNPTkZJR19TTkRfU09DX0lNR19QSVNUQUNISU9fSU5URVJOQUxfREFD
PW0KIyBDT05GSUdfU05EX1NPQ19JTlRFTF9TU1RfVE9QTEVWRUwgaXMgbm90IHNldAoKIwojIFNU
TWljcm9lbGVjdHJvbmljcyBTVE0zMiBTT0MgYXVkaW8gc3VwcG9ydAojCkNPTkZJR19TTkRfU09D
X1hURlBHQV9JMlM9bQpDT05GSUdfWlhfVERNPW0KQ09ORklHX1NORF9TT0NfSTJDX0FORF9TUEk9
bQoKIwojIENPREVDIGRyaXZlcnMKIwpDT05GSUdfU05EX1NPQ19BQzk3X0NPREVDPW0KQ09ORklH
X1NORF9TT0NfQURBVV9VVElMUz1tCkNPTkZJR19TTkRfU09DX0FEQVUxNzAxPW0KQ09ORklHX1NO
RF9TT0NfQURBVTE3WDE9bQpDT05GSUdfU05EX1NPQ19BREFVMTc2MT1tCkNPTkZJR19TTkRfU09D
X0FEQVUxNzYxX0kyQz1tCkNPTkZJR19TTkRfU09DX0FEQVUxNzYxX1NQST1tCkNPTkZJR19TTkRf
U09DX0FEQVU3MDAyPW0KQ09ORklHX1NORF9TT0NfQUs0MTA0PW0KQ09ORklHX1NORF9TT0NfQUs0
NDU4PW0KQ09ORklHX1NORF9TT0NfQUs0NTU0PW0KQ09ORklHX1NORF9TT0NfQUs0NjEzPW0KQ09O
RklHX1NORF9TT0NfQUs0NjQyPW0KQ09ORklHX1NORF9TT0NfQUs1Mzg2PW0KQ09ORklHX1NORF9T
T0NfQUs1NTU4PW0KQ09ORklHX1NORF9TT0NfQUxDNTYyMz1tCkNPTkZJR19TTkRfU09DX0JEMjg2
MjM9bQpDT05GSUdfU05EX1NPQ19CVF9TQ089bQpDT05GSUdfU05EX1NPQ19DUzM1TDMyPW0KQ09O
RklHX1NORF9TT0NfQ1MzNUwzMz1tCkNPTkZJR19TTkRfU09DX0NTMzVMMzQ9bQpDT05GSUdfU05E
X1NPQ19DUzM1TDM1PW0KQ09ORklHX1NORF9TT0NfQ1M0Mkw0Mj1tCkNPTkZJR19TTkRfU09DX0NT
NDJMNTE9bQpDT05GSUdfU05EX1NPQ19DUzQyTDUxX0kyQz1tCiMgQ09ORklHX1NORF9TT0NfQ1M0
Mkw1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0Mkw1NiBpcyBub3Qgc2V0CkNPTkZJ
R19TTkRfU09DX0NTNDJMNzM9bQpDT05GSUdfU05EX1NPQ19DUzQyNjU9bQpDT05GSUdfU05EX1NP
Q19DUzQyNzA9bQpDT05GSUdfU05EX1NPQ19DUzQyNzE9bQpDT05GSUdfU05EX1NPQ19DUzQyNzFf
STJDPW0KQ09ORklHX1NORF9TT0NfQ1M0MjcxX1NQST1tCkNPTkZJR19TTkRfU09DX0NTNDJYWDg9
bQpDT05GSUdfU05EX1NPQ19DUzQyWFg4X0kyQz1tCkNPTkZJR19TTkRfU09DX0NTNDMxMzA9bQpD
T05GSUdfU05EX1NPQ19DUzQzNDk9bQpDT05GSUdfU05EX1NPQ19DUzUzTDMwPW0KQ09ORklHX1NO
RF9TT0NfREE3MjE5PW0KQ09ORklHX1NORF9TT0NfRElPMjEyNT1tCkNPTkZJR19TTkRfU09DX0VT
NzEzND1tCkNPTkZJR19TTkRfU09DX0VTODMxNj1tCkNPTkZJR19TTkRfU09DX0VTODMyOD1tCkNP
TkZJR19TTkRfU09DX0VTODMyOF9JMkM9bQpDT05GSUdfU05EX1NPQ19FUzgzMjhfU1BJPW0KQ09O
RklHX1NORF9TT0NfR1RNNjAxPW0KQ09ORklHX1NORF9TT0NfSU5OT19SSzMwMzY9bQpDT05GSUdf
U05EX1NPQ19NQVg5ODM1N0E9bQpDT05GSUdfU05EX1NPQ19NQVg5ODUwND1tCkNPTkZJR19TTkRf
U09DX01BWDk4Njc9bQpDT05GSUdfU05EX1NPQ19NQVg5ODkyNz1tCkNPTkZJR19TTkRfU09DX01B
WDk4MzczPW0KQ09ORklHX1NORF9TT0NfTUFYOTg2MD1tCkNPTkZJR19TTkRfU09DX01TTTg5MTZf
V0NEX0FOQUxPRz1tCkNPTkZJR19TTkRfU09DX01TTTg5MTZfV0NEX0RJR0lUQUw9bQpDT05GSUdf
U05EX1NPQ19QQ00xNjgxPW0KQ09ORklHX1NORF9TT0NfUENNMTc4OT1tCkNPTkZJR19TTkRfU09D
X1BDTTE3ODlfSTJDPW0KQ09ORklHX1NORF9TT0NfUENNMTc5WD1tCkNPTkZJR19TTkRfU09DX1BD
TTE3OVhfSTJDPW0KQ09ORklHX1NORF9TT0NfUENNMTc5WF9TUEk9bQpDT05GSUdfU05EX1NPQ19Q
Q00xODZYPW0KQ09ORklHX1NORF9TT0NfUENNMTg2WF9JMkM9bQpDT05GSUdfU05EX1NPQ19QQ00x
ODZYX1NQST1tCkNPTkZJR19TTkRfU09DX1BDTTMxNjhBPW0KQ09ORklHX1NORF9TT0NfUENNMzE2
OEFfSTJDPW0KQ09ORklHX1NORF9TT0NfUENNMzE2OEFfU1BJPW0KQ09ORklHX1NORF9TT0NfUENN
NTEyeD1tCkNPTkZJR19TTkRfU09DX1BDTTUxMnhfSTJDPW0KQ09ORklHX1NORF9TT0NfUENNNTEy
eF9TUEk9bQpDT05GSUdfU05EX1NPQ19STDYyMzE9bQpDT05GSUdfU05EX1NPQ19SVDU2MTY9bQpD
T05GSUdfU05EX1NPQ19SVDU2MzE9bQpDT05GSUdfU05EX1NPQ19SVDU2NDU9bQpDT05GSUdfU05E
X1NPQ19TR1RMNTAwMD1tCkNPTkZJR19TTkRfU09DX1NJR01BRFNQPW0KQ09ORklHX1NORF9TT0Nf
U0lHTUFEU1BfSTJDPW0KQ09ORklHX1NORF9TT0NfU0lHTUFEU1BfUkVHTUFQPW0KQ09ORklHX1NO
RF9TT0NfU0lSRl9BVURJT19DT0RFQz1tCkNPTkZJR19TTkRfU09DX1NQRElGPW0KQ09ORklHX1NO
RF9TT0NfU1NNMjYwMj1tCkNPTkZJR19TTkRfU09DX1NTTTI2MDJfU1BJPW0KQ09ORklHX1NORF9T
T0NfU1NNMjYwMl9JMkM9bQpDT05GSUdfU05EX1NPQ19TU000NTY3PW0KQ09ORklHX1NORF9TT0Nf
U1RBMzJYPW0KQ09ORklHX1NORF9TT0NfU1RBMzUwPW0KQ09ORklHX1NORF9TT0NfU1RJX1NBUz1t
CkNPTkZJR19TTkRfU09DX1RBUzI1NTI9bQpDT05GSUdfU05EX1NPQ19UQVM1MDg2PW0KQ09ORklH
X1NORF9TT0NfVEFTNTcxWD1tCkNPTkZJR19TTkRfU09DX1RBUzU3MjA9bQpDT05GSUdfU05EX1NP
Q19UQVM2NDI0PW0KQ09ORklHX1NORF9TT0NfVERBNzQxOT1tCkNPTkZJR19TTkRfU09DX1RGQTk4
Nzk9bQpDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMyMz1tCkNPTkZJR19TTkRfU09DX1RMVjMyMEFJ
QzIzX0kyQz1tCkNPTkZJR19TTkRfU09DX1RMVjMyMEFJQzIzX1NQST1tCkNPTkZJR19TTkRfU09D
X1RMVjMyMEFJQzMxWFg9bQpDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMlg0PW0KQ09ORklHX1NO
RF9TT0NfVExWMzIwQUlDMzJYNF9JMkM9bQpDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMlg0X1NQ
ST1tCkNPTkZJR19TTkRfU09DX1RMVjMyMEFJQzNYPW0KQ09ORklHX1NORF9TT0NfVFMzQTIyN0U9
bQpDT05GSUdfU05EX1NPQ19UU0NTNDJYWD1tCkNPTkZJR19TTkRfU09DX1dNODUxMD1tCkNPTkZJ
R19TTkRfU09DX1dNODUyMz1tCkNPTkZJR19TTkRfU09DX1dNODUyND1tCkNPTkZJR19TTkRfU09D
X1dNODU4MD1tCkNPTkZJR19TTkRfU09DX1dNODcxMT1tCkNPTkZJR19TTkRfU09DX1dNODcyOD1t
CkNPTkZJR19TTkRfU09DX1dNODczMT1tCkNPTkZJR19TTkRfU09DX1dNODczNz1tCkNPTkZJR19T
TkRfU09DX1dNODc0MT1tCkNPTkZJR19TTkRfU09DX1dNODc1MD1tCkNPTkZJR19TTkRfU09DX1dN
ODc1Mz1tCkNPTkZJR19TTkRfU09DX1dNODc3MD1tCkNPTkZJR19TTkRfU09DX1dNODc3Nj1tCkNP
TkZJR19TTkRfU09DX1dNODgwND1tCkNPTkZJR19TTkRfU09DX1dNODgwNF9JMkM9bQpDT05GSUdf
U05EX1NPQ19XTTg4MDRfU1BJPW0KQ09ORklHX1NORF9TT0NfV004OTAzPW0KQ09ORklHX1NORF9T
T0NfV004OTYwPW0KIyBDT05GSUdfU05EX1NPQ19XTTg5NjIgaXMgbm90IHNldApDT05GSUdfU05E
X1NPQ19XTTg5NzQ9bQpDT05GSUdfU05EX1NPQ19XTTg5Nzg9bQpDT05GSUdfU05EX1NPQ19XTTg5
ODU9bQojIENPTkZJR19TTkRfU09DX1pYX0FVRDk2UDIyIGlzIG5vdCBzZXQKQ09ORklHX1NORF9T
T0NfTUFYOTc1OT1tCkNPTkZJR19TTkRfU09DX05BVTg1NDA9bQpDT05GSUdfU05EX1NPQ19OQVU4
ODEwPW0KQ09ORklHX1NORF9TT0NfTkFVODgyND1tCkNPTkZJR19TTkRfU09DX1RQQTYxMzBBMj1t
CkNPTkZJR19TTkRfU0lNUExFX0NBUkRfVVRJTFM9bQpDT05GSUdfU05EX1NJTVBMRV9DQVJEPW0K
Q09ORklHX1NORF9TSU1QTEVfU0NVX0NBUkQ9bQojIENPTkZJR19TTkRfQVVESU9fR1JBUEhfQ0FS
RCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVURJT19HUkFQSF9TQ1VfQ0FSRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9YODYgaXMgbm90IHNldApDT05GSUdfQUM5N19CVVM9bQoKIwojIEhJRCBz
dXBwb3J0CiMKQ09ORklHX0hJRD15CiMgQ09ORklHX0hJRF9CQVRURVJZX1NUUkVOR1RIIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEUkFXIGlzIG5vdCBzZXQKIyBDT05GSUdfVUhJRCBpcyBub3Qgc2V0
CkNPTkZJR19ISURfR0VORVJJQz15CgojCiMgU3BlY2lhbCBISUQgZHJpdmVycwojCiMgQ09ORklH
X0hJRF9BNFRFQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfQUNSVVggaXMgbm90IHNldAojIENP
TkZJR19ISURfQVBQTEUgaXMgbm90IHNldAojIENPTkZJR19ISURfQVNVUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9BVVJFQUwgaXMgbm90IHNldAojIENPTkZJR19ISURfQkVMS0lOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0NIRVJSWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DSElDT05ZIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1BST0RJS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9D
TUVESUEgaXMgbm90IHNldAojIENPTkZJR19ISURfQ1lQUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9EUkFHT05SSVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VNU19GRiBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9FTEVDT00gaXMgbm90IHNldAojIENPTkZJR19ISURfRVpLRVkgaXMgbm90
IHNldAojIENPTkZJR19ISURfR0VNQklSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HRlJNIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0tFWVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tZ
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUxUT1AgaXMgbm90IHNldAojIENPTkZJR19ISURf
R1lSQVRJT04gaXMgbm90IHNldAojIENPTkZJR19ISURfSUNBREUgaXMgbm90IHNldAojIENPTkZJ
R19ISURfSVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0pBQlJBIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1RXSU5IQU4gaXMgbm90IHNldAojIENPTkZJR19ISURfS0VOU0lOR1RPTiBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9MQ1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0xFRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9MRU5PVk8gaXMgbm90IHNldAojIENPTkZJR19ISURfTE9HSVRF
Q0ggaXMgbm90IHNldAojIENPTkZJR19ISURfTUFHSUNNT1VTRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9NQVlGTEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NSUNST1NPRlQgaXMgbm90IHNl
dAojIENPTkZJR19ISURfTU9OVEVSRVkgaXMgbm90IHNldAojIENPTkZJR19ISURfTVVMVElUT1VD
SCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9OVEkgaXMgbm90IHNldAojIENPTkZJR19ISURfT1JU
RUsgaXMgbm90IHNldAojIENPTkZJR19ISURfUEFOVEhFUkxPUkQgaXMgbm90IHNldAojIENPTkZJ
R19ISURfUEVUQUxZTlggaXMgbm90IHNldAojIENPTkZJR19ISURfUElDT0xDRCBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9QTEFOVFJPTklDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QUklNQVgg
aXMgbm90IHNldAojIENPTkZJR19ISURfU0FJVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NB
TVNVTkcgaXMgbm90IHNldAojIENPTkZJR19ISURfU1BFRURMSU5LIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1NURUVMU0VSSUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NVTlBMVVMgaXMgbm90
IHNldAojIENPTkZJR19ISURfUk1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dSRUVOQVNJQSBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TTUFSVEpPWVBMVVMgaXMgbm90IHNldAojIENPTkZJR19I
SURfVElWTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9UT1BTRUVEIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1RISU5HTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USFJVU1RNQVNURVIgaXMgbm90
IHNldAojIENPTkZJR19ISURfVURSQVdfUFMzIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1dJSU1P
VEUgaXMgbm90IHNldAojIENPTkZJR19ISURfWElOTU8gaXMgbm90IHNldAojIENPTkZJR19ISURf
WkVST1BMVVMgaXMgbm90IHNldAojIENPTkZJR19ISURfWllEQUNST04gaXMgbm90IHNldAojIENP
TkZJR19ISURfU0VOU09SX0hVQiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BTFBTIGlzIG5vdCBz
ZXQKCiMKIyBJMkMgSElEIHN1cHBvcnQKIwojIENPTkZJR19JMkNfSElEIGlzIG5vdCBzZXQKCiMK
IyBJbnRlbCBJU0ggSElEIHN1cHBvcnQKIwojIENPTkZJR19JTlRFTF9JU0hfSElEIGlzIG5vdCBz
ZXQKQ09ORklHX1VTQl9PSENJX0xJVFRMRV9FTkRJQU49eQpDT05GSUdfVVNCX1NVUFBPUlQ9eQpD
T05GSUdfVVNCX0FSQ0hfSEFTX0hDRD15CiMgQ09ORklHX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfUENJPXkKCiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKCiMKIyBVU0IgUGh5c2ljYWwgTGF5ZXIg
ZHJpdmVycwojCiMgQ09ORklHX05PUF9VU0JfWENFSVYgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
R1BJT19WQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dBREdFVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1RZUEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xFRF9UUklHIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1VMUElfQlVTIGlzIG5vdCBzZXQKQ09ORklHX1VXQj1tCiMgQ09ORklHX1VXQl9X
SENJIGlzIG5vdCBzZXQKQ09ORklHX01NQz1tCkNPTkZJR19QV1JTRVFfRU1NQz1tCkNPTkZJR19Q
V1JTRVFfU0lNUExFPW0KQ09ORklHX1NESU9fVUFSVD1tCkNPTkZJR19NTUNfVEVTVD1tCgojCiMg
TU1DL1NEL1NESU8gSG9zdCBDb250cm9sbGVyIERyaXZlcnMKIwojIENPTkZJR19NTUNfREVCVUcg
aXMgbm90IHNldApDT05GSUdfTU1DX1NESENJPW0KQ09ORklHX01NQ19TREhDSV9QQ0k9bQojIENP
TkZJR19NTUNfUklDT0hfTU1DIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1NESENJX0FDUEkgaXMg
bm90IHNldAojIENPTkZJR19NTUNfU0RIQ0lfUExURk0gaXMgbm90IHNldAojIENPTkZJR19NTUNf
VElGTV9TRCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19TUEkgaXMgbm90IHNldApDT05GSUdfTU1D
X0NCNzEwPW0KIyBDT05GSUdfTU1DX1ZJQV9TRE1NQyBpcyBub3Qgc2V0CkNPTkZJR19NTUNfVVNE
SEk2Uk9MMD1tCiMgQ09ORklHX01NQ19SRUFMVEVLX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19NTUNf
Q1FIQ0k9bQpDT05GSUdfTU1DX1RPU0hJQkFfUENJPW0KQ09ORklHX01NQ19NVEs9bQpDT05GSUdf
TUVNU1RJQ0s9bQpDT05GSUdfTUVNU1RJQ0tfREVCVUc9eQoKIwojIE1lbW9yeVN0aWNrIGRyaXZl
cnMKIwpDT05GSUdfTUVNU1RJQ0tfVU5TQUZFX1JFU1VNRT15CgojCiMgTWVtb3J5U3RpY2sgSG9z
dCBDb250cm9sbGVyIERyaXZlcnMKIwpDT05GSUdfTUVNU1RJQ0tfVElGTV9NUz1tCiMgQ09ORklH
X01FTVNUSUNLX0pNSUNST05fMzhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNU1RJQ0tfUjU5MiBp
cyBub3Qgc2V0CiMgQ09ORklHX01FTVNUSUNLX1JFQUxURUtfUENJIGlzIG5vdCBzZXQKQ09ORklH
X05FV19MRURTPXkKQ09ORklHX0xFRFNfQ0xBU1M9eQpDT05GSUdfTEVEU19DTEFTU19GTEFTSD1t
CkNPTkZJR19MRURTX0JSSUdIVE5FU1NfSFdfQ0hBTkdFRD15CgojCiMgTEVEIGRyaXZlcnMKIwpD
T05GSUdfTEVEU184OFBNODYwWD1tCiMgQ09ORklHX0xFRFNfQVMzNjQ1QSBpcyBub3Qgc2V0CkNP
TkZJR19MRURTX0JDTTYzMjg9eQpDT05GSUdfTEVEU19CQ002MzU4PW0KIyBDT05GSUdfTEVEU19M
TTM1MzAgaXMgbm90IHNldApDT05GSUdfTEVEU19MTTM1MzM9eQpDT05GSUdfTEVEU19MTTM2NDI9
bQojIENPTkZJR19MRURTX0xNMzY5MlggaXMgbm90IHNldAojIENPTkZJR19MRURTX1BDQTk1MzIg
aXMgbm90IHNldApDT05GSUdfTEVEU19HUElPPXkKQ09ORklHX0xFRFNfTFAzOTQ0PW0KQ09ORklH
X0xFRFNfTFAzOTUyPXkKQ09ORklHX0xFRFNfTFA1NVhYX0NPTU1PTj15CiMgQ09ORklHX0xFRFNf
TFA1NTIxIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTFA1NTIzPXkKIyBDT05GSUdfTEVEU19MUDU1
NjIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQODUwMSBpcyBub3Qgc2V0CkNPTkZJR19MRURT
X0xQODc4OD1tCiMgQ09ORklHX0xFRFNfTFA4ODYwIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfUENB
OTU1WD1tCiMgQ09ORklHX0xFRFNfUENBOTU1WF9HUElPIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNf
UENBOTYzWD15CkNPTkZJR19MRURTX1dNODMxWF9TVEFUVVM9bQpDT05GSUdfTEVEU19EQUMxMjRT
MDg1PXkKQ09ORklHX0xFRFNfUkVHVUxBVE9SPW0KQ09ORklHX0xFRFNfQkQyODAyPW0KQ09ORklH
X0xFRFNfTFQzNTkzPXkKQ09ORklHX0xFRFNfQURQNTUyMD1tCkNPTkZJR19MRURTX01DMTM3ODM9
bQojIENPTkZJR19MRURTX1RDQTY1MDcgaXMgbm90IHNldApDT05GSUdfTEVEU19UTEM1OTFYWD15
CiMgQ09ORklHX0xFRFNfTUFYNzc2OTMgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzU1eCBp
cyBub3Qgc2V0CkNPTkZJR19MRURTX01FTkYyMUJNQz1tCiMgQ09ORklHX0xFRFNfS1REMjY5MiBp
cyBub3Qgc2V0CkNPTkZJR19MRURTX0lTMzFGTDMxOVg9eQojIENPTkZJR19MRURTX0lTMzFGTDMy
WFggaXMgbm90IHNldAoKIwojIExFRCBkcml2ZXIgZm9yIGJsaW5rKDEpIFVTQiBSR0IgTEVEIGlz
IHVuZGVyIFNwZWNpYWwgSElEIGRyaXZlcnMgKEhJRF9USElOR00pCiMKIyBDT05GSUdfTEVEU19C
TElOS00gaXMgbm90IHNldAojIENPTkZJR19MRURTX1NZU0NPTiBpcyBub3Qgc2V0CkNPTkZJR19M
RURTX01MWFJFRz1tCkNPTkZJR19MRURTX1VTRVI9eQojIENPTkZJR19MRURTX05JQzc4QlggaXMg
bm90IHNldAoKIwojIExFRCBUcmlnZ2VycwojCkNPTkZJR19MRURTX1RSSUdHRVJTPXkKIyBDT05G
SUdfTEVEU19UUklHR0VSX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFJJR0dFUl9PTkVT
SE9UPW0KIyBDT05GSUdfTEVEU19UUklHR0VSX01URCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RS
SUdHRVJfSEVBUlRCRUFUPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RS
SUdHRVJfQUNUSVZJVFkgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfR1BJTyBpcyBu
b3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfREVGQVVMVF9PTj15CgojCiMgaXB0YWJsZXMgdHJp
Z2dlciBpcyB1bmRlciBOZXRmaWx0ZXIgY29uZmlnIChMRUQgdGFyZ2V0KQojCiMgQ09ORklHX0xF
RFNfVFJJR0dFUl9UUkFOU0lFTlQgaXMgbm90IHNldApDT05GSUdfTEVEU19UUklHR0VSX0NBTUVS
QT1tCiMgQ09ORklHX0xFRFNfVFJJR0dFUl9QQU5JQyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RS
SUdHRVJfTkVUREVWPW0KIyBDT05GSUdfQUNDRVNTSUJJTElUWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lORklOSUJBTkQgaXMgbm90IHNldApDT05GSUdfRURBQ19BVE9NSUNfU0NSVUI9eQpDT05GSUdf
RURBQ19TVVBQT1JUPXkKQ09ORklHX1JUQ19MSUI9eQpDT05GSUdfUlRDX01DMTQ2ODE4X0xJQj15
CkNPTkZJR19SVENfQ0xBU1M9eQojIENPTkZJR19SVENfSENUT1NZUyBpcyBub3Qgc2V0CkNPTkZJ
R19SVENfU1lTVE9IQz15CkNPTkZJR19SVENfU1lTVE9IQ19ERVZJQ0U9InJ0YzAiCkNPTkZJR19S
VENfREVCVUc9eQojIENPTkZJR19SVENfTlZNRU0gaXMgbm90IHNldAoKIwojIFJUQyBpbnRlcmZh
Y2VzCiMKIyBDT05GSUdfUlRDX0lOVEZfU1lTRlMgaXMgbm90IHNldApDT05GSUdfUlRDX0lOVEZf
UFJPQz15CiMgQ09ORklHX1JUQ19JTlRGX0RFViBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1RF
U1Q9eQoKIwojIEkyQyBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfRFJWXzg4UE04NjBYPXkKQ09O
RklHX1JUQ19EUlZfODhQTTgwWD15CiMgQ09ORklHX1JUQ19EUlZfQUJCNVpFUzMgaXMgbm90IHNl
dApDT05GSUdfUlRDX0RSVl9BQlg4MFg9eQojIENPTkZJR19SVENfRFJWX0RTMTMwNyBpcyBub3Qg
c2V0CkNPTkZJR19SVENfRFJWX0RTMTM3ND15CkNPTkZJR19SVENfRFJWX0RTMTM3NF9XRFQ9eQpD
T05GSUdfUlRDX0RSVl9EUzE2NzI9eQpDT05GSUdfUlRDX0RSVl9IWU04NTYzPXkKQ09ORklHX1JU
Q19EUlZfTFA4Nzg4PW0KQ09ORklHX1JUQ19EUlZfTUFYNjkwMD1tCkNPTkZJR19SVENfRFJWX01B
WDg5MjU9eQpDT05GSUdfUlRDX0RSVl9NQVg3NzY4Nj1tCiMgQ09ORklHX1JUQ19EUlZfUlM1QzM3
MiBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0lTTDEyMDg9eQojIENPTkZJR19SVENfRFJWX0lT
TDEyMDIyIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfSVNMMTIwMjY9bQpDT05GSUdfUlRDX0RS
Vl9YMTIwNT1tCiMgQ09ORklHX1JUQ19EUlZfUENGODUyMyBpcyBub3Qgc2V0CkNPTkZJR19SVENf
RFJWX1BDRjg1MDYzPXkKQ09ORklHX1JUQ19EUlZfUENGODUzNjM9eQojIENPTkZJR19SVENfRFJW
X1BDRjg1NjMgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9QQ0Y4NTgzPXkKIyBDT05GSUdfUlRD
X0RSVl9NNDFUODAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0JRMzJLIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1RQUzY1
OTEwIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfUkM1VDU4Mz15CkNPTkZJR19SVENfRFJWX1Mz
NTM5MEE9bQpDT05GSUdfUlRDX0RSVl9GTTMxMzA9bQpDT05GSUdfUlRDX0RSVl9SWDgwMTA9eQpD
T05GSUdfUlRDX0RSVl9SWDg1ODE9bQpDT05GSUdfUlRDX0RSVl9SWDgwMjU9eQojIENPTkZJR19S
VENfRFJWX0VNMzAyNyBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1JWODgwMz1tCgojCiMgU1BJ
IFJUQyBkcml2ZXJzCiMKQ09ORklHX1JUQ19EUlZfTTQxVDkzPW0KIyBDT05GSUdfUlRDX0RSVl9N
NDFUOTQgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9EUzEzMDI9eQojIENPTkZJR19SVENfRFJW
X0RTMTMwNSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RTMTM0Mz15CiMgQ09ORklHX1JUQ19E
UlZfRFMxMzQ3IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzOTAgaXMgbm90IHNldApD
T05GSUdfUlRDX0RSVl9NQVg2OTE2PW0KQ09ORklHX1JUQ19EUlZfUjk3MDE9eQojIENPTkZJR19S
VENfRFJWX1JYNDU4MSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1JYNjExMD15CkNPTkZJR19S
VENfRFJWX1JTNUMzNDg9eQojIENPTkZJR19SVENfRFJWX01BWDY5MDIgaXMgbm90IHNldApDT05G
SUdfUlRDX0RSVl9QQ0YyMTIzPW0KQ09ORklHX1JUQ19EUlZfTUNQNzk1PXkKQ09ORklHX1JUQ19J
MkNfQU5EX1NQST15CgojCiMgU1BJIGFuZCBJMkMgUlRDIGRyaXZlcnMKIwojIENPTkZJR19SVENf
RFJWX0RTMzIzMiBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1BDRjIxMjc9eQpDT05GSUdfUlRD
X0RSVl9SVjMwMjlDMj1tCkNPTkZJR19SVENfRFJWX1JWMzAyOV9IV01PTj15CgojCiMgUGxhdGZv
cm0gUlRDIGRyaXZlcnMKIwpDT05GSUdfUlRDX0RSVl9DTU9TPXkKIyBDT05GSUdfUlRDX0RSVl9E
UzEyODYgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9EUzE1MTE9eQpDT05GSUdfUlRDX0RSVl9E
UzE1NTM9bQpDT05GSUdfUlRDX0RSVl9EUzE2ODVfRkFNSUxZPXkKQ09ORklHX1JUQ19EUlZfRFMx
Njg1PXkKIyBDT05GSUdfUlRDX0RSVl9EUzE2ODkgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0RTMTcyODUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTc0ODUgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX0RTMTc4ODUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFMxNjg1X1BS
T0NfUkVHUyBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFMxNjg1X1NZU0ZTX1JFR1M9eQpDT05GSUdf
UlRDX0RSVl9EUzE3NDI9eQpDT05GSUdfUlRDX0RSVl9EUzI0MDQ9eQpDT05GSUdfUlRDX0RSVl9E
QTkwNjM9bQpDT05GSUdfUlRDX0RSVl9TVEsxN1RBOD15CkNPTkZJR19SVENfRFJWX000OFQ4Nj1t
CkNPTkZJR19SVENfRFJWX000OFQzNT1tCiMgQ09ORklHX1JUQ19EUlZfTTQ4VDU5IGlzIG5vdCBz
ZXQKQ09ORklHX1JUQ19EUlZfTVNNNjI0Mj15CkNPTkZJR19SVENfRFJWX0JRNDgwMj15CkNPTkZJ
R19SVENfRFJWX1JQNUMwMT1tCkNPTkZJR19SVENfRFJWX1YzMDIwPW0KQ09ORklHX1JUQ19EUlZf
V004MzFYPXkKIyBDT05GSUdfUlRDX0RSVl9aWU5RTVAgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX0NST1NfRUMgaXMgbm90IHNldAoKIwojIG9uLUNQVSBSVEMgZHJpdmVycwojCkNPTkZJR19S
VENfRFJWX0ZUUlRDMDEwPXkKQ09ORklHX1JUQ19EUlZfUENBUD1tCkNPTkZJR19SVENfRFJWX01D
MTNYWFg9bQpDT05GSUdfUlRDX0RSVl9TTlZTPW0KQ09ORklHX1JUQ19EUlZfUjczMDE9bQoKIwoj
IEhJRCBTZW5zb3IgUlRDIGRyaXZlcnMKIwpDT05GSUdfRE1BREVWSUNFUz15CkNPTkZJR19ETUFE
RVZJQ0VTX0RFQlVHPXkKQ09ORklHX0RNQURFVklDRVNfVkRFQlVHPXkKCiMKIyBETUEgRGV2aWNl
cwojCkNPTkZJR19ETUFfRU5HSU5FPXkKQ09ORklHX0RNQV9WSVJUVUFMX0NIQU5ORUxTPW0KQ09O
RklHX0RNQV9BQ1BJPXkKQ09ORklHX0RNQV9PRj15CkNPTkZJR19BTFRFUkFfTVNHRE1BPXkKIyBD
T05GSUdfRFdfQVhJX0RNQUMgaXMgbm90IHNldAojIENPTkZJR19GU0xfRURNQSBpcyBub3Qgc2V0
CkNPTkZJR19JTlRFTF9JRE1BNjQ9bQojIENPTkZJR19JTlRFTF9JT0FURE1BIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5URUxfTUlDX1gxMDBfRE1BIGlzIG5vdCBzZXQKQ09ORklHX1FDT01fSElETUFf
TUdNVD15CiMgQ09ORklHX1FDT01fSElETUEgaXMgbm90IHNldApDT05GSUdfRFdfRE1BQ19DT1JF
PXkKIyBDT05GSUdfRFdfRE1BQyBpcyBub3Qgc2V0CkNPTkZJR19EV19ETUFDX1BDST15CgojCiMg
RE1BIENsaWVudHMKIwojIENPTkZJR19BU1lOQ19UWF9ETUEgaXMgbm90IHNldApDT05GSUdfRE1B
VEVTVD15CkNPTkZJR19ETUFfRU5HSU5FX1JBSUQ9eQoKIwojIERNQUJVRiBvcHRpb25zCiMKIyBD
T05GSUdfU1lOQ19GSUxFIGlzIG5vdCBzZXQKIyBDT05GSUdfQVVYRElTUExBWSBpcyBub3Qgc2V0
CkNPTkZJR19DSEFSTENEPXkKQ09ORklHX1BBTkVMPXkKQ09ORklHX1BBTkVMX1BBUlBPUlQ9MApD
T05GSUdfUEFORUxfUFJPRklMRT01CiMgQ09ORklHX1BBTkVMX0NIQU5HRV9NRVNTQUdFIGlzIG5v
dCBzZXQKQ09ORklHX1VJTz15CkNPTkZJR19VSU9fQ0lGPW0KQ09ORklHX1VJT19QRFJWX0dFTklS
UT1tCkNPTkZJR19VSU9fRE1FTV9HRU5JUlE9eQpDT05GSUdfVUlPX0FFQz15CkNPTkZJR19VSU9f
U0VSQ09TMz15CkNPTkZJR19VSU9fUENJX0dFTkVSSUM9bQpDT05GSUdfVUlPX05FVFg9eQojIENP
TkZJR19VSU9fUFJVU1MgaXMgbm90IHNldApDT05GSUdfVUlPX01GNjI0PXkKIyBDT05GSUdfVklS
VF9EUklWRVJTIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJTz15CiMgQ09ORklHX1ZJUlRJT19NRU5V
IGlzIG5vdCBzZXQKCiMKIyBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CiMKIyBDT05G
SUdfSFlQRVJWIGlzIG5vdCBzZXQKQ09ORklHX1NUQUdJTkc9eQojIENPTkZJR19JUFggaXMgbm90
IHNldAojIENPTkZJR19OQ1BfRlMgaXMgbm90IHNldAojIENPTkZJR19DT01FREkgaXMgbm90IHNl
dAojIENPTkZJR19SVExMSUIgaXMgbm90IHNldAoKIwojIElJTyBzdGFnaW5nIGRyaXZlcnMKIwoK
IwojIEFjY2VsZXJvbWV0ZXJzCiMKQ09ORklHX0FESVMxNjIwMT1tCiMgQ09ORklHX0FESVMxNjIw
MyBpcyBub3Qgc2V0CkNPTkZJR19BRElTMTYyMDk9bQpDT05GSUdfQURJUzE2MjQwPW0KCiMKIyBB
bmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKQ09ORklHX0FENzYwNj1tCiMgQ09ORklHX0FE
NzYwNl9JRkFDRV9QQVJBTExFTCBpcyBub3Qgc2V0CkNPTkZJR19BRDc2MDZfSUZBQ0VfU1BJPW0K
Q09ORklHX0FENzc4MD1tCkNPTkZJR19BRDc4MTY9bQojIENPTkZJR19BRDcxOTIgaXMgbm90IHNl
dApDT05GSUdfQUQ3MjgwPW0KCiMKIyBBbmFsb2cgZGlnaXRhbCBiaS1kaXJlY3Rpb24gY29udmVy
dGVycwojCkNPTkZJR19BRFQ3MzE2PW0KQ09ORklHX0FEVDczMTZfU1BJPW0KIyBDT05GSUdfQURU
NzMxNl9JMkMgaXMgbm90IHNldAoKIwojIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVy
cwojCkNPTkZJR19BRDcxNTA9bQpDT05GSUdfQUQ3MTUyPW0KQ09ORklHX0FENzc0Nj1tCgojCiMg
RGlyZWN0IERpZ2l0YWwgU3ludGhlc2lzCiMKQ09ORklHX0FEOTgzMj1tCkNPTkZJR19BRDk4MzQ9
bQoKIwojIERpZ2l0YWwgZ3lyb3Njb3BlIHNlbnNvcnMKIwojIENPTkZJR19BRElTMTYwNjAgaXMg
bm90IHNldAoKIwojIE5ldHdvcmsgQW5hbHl6ZXIsIEltcGVkYW5jZSBDb252ZXJ0ZXJzCiMKQ09O
RklHX0FENTkzMz1tCgojCiMgTGlnaHQgc2Vuc29ycwojCkNPTkZJR19UU0wyeDd4PW0KCiMKIyBB
Y3RpdmUgZW5lcmd5IG1ldGVyaW5nIElDCiMKQ09ORklHX0FERTc3NTM9bQpDT05GSUdfQURFNzc1
ND1tCiMgQ09ORklHX0FERTc3NTggaXMgbm90IHNldAojIENPTkZJR19BREU3NzU5IGlzIG5vdCBz
ZXQKQ09ORklHX0FERTc4NTQ9bQpDT05GSUdfQURFNzg1NF9JMkM9bQpDT05GSUdfQURFNzg1NF9T
UEk9bQoKIwojIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojCkNPTkZJR19BRDJTOTA9
bQpDT05GSUdfQUQyUzEyMDA9bQpDT05GSUdfQUQyUzEyMTA9bQojIENPTkZJR19GQl9TTTc1MCBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX1hHSSBpcyBub3Qgc2V0CgojCiMgU3BlYWt1cCBjb25zb2xl
IHNwZWVjaAojCkNPTkZJR19TVEFHSU5HX01FRElBPXkKCiMKIyBBbmRyb2lkCiMKIyBDT05GSUdf
U1RBR0lOR19CT0FSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0xORVQgaXMgbm90IHNldApDT05GSUdf
REdOQz15CkNPTkZJR19HU19GUEdBQk9PVD1tCkNPTkZJR19DUllQVE9fU0tFSU49bQpDT05GSUdf
VU5JU1lTU1BBUj15CiMgQ09ORklHX0NPTU1PTl9DTEtfWExOWF9DTEtXWlJEIGlzIG5vdCBzZXQK
Q09ORklHX0ZCX1RGVD1tCkNPTkZJR19GQl9URlRfQUdNMTI2NEtfRkw9bQpDT05GSUdfRkJfVEZU
X0JENjYzNDc0PW0KQ09ORklHX0ZCX1RGVF9IWDgzNDBCTj1tCiMgQ09ORklHX0ZCX1RGVF9IWDgz
NDdEIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVEZUX0hYODM1M0QgaXMgbm90IHNldAojIENPTkZJ
R19GQl9URlRfSFg4MzU3RCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RGVF9JTEk5MTYzIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfVEZUX0lMSTkzMjAgaXMgbm90IHNldAojIENPTkZJR19GQl9URlRf
SUxJOTMyNSBpcyBub3Qgc2V0CkNPTkZJR19GQl9URlRfSUxJOTM0MD1tCiMgQ09ORklHX0ZCX1RG
VF9JTEk5MzQxIGlzIG5vdCBzZXQKQ09ORklHX0ZCX1RGVF9JTEk5NDgxPW0KQ09ORklHX0ZCX1RG
VF9JTEk5NDg2PW0KQ09ORklHX0ZCX1RGVF9QQ0Q4NTQ0PW0KIyBDT05GSUdfRkJfVEZUX1JBODg3
NSBpcyBub3Qgc2V0CkNPTkZJR19GQl9URlRfUzZEMDJBMT1tCkNPTkZJR19GQl9URlRfUzZEMTEy
MT1tCkNPTkZJR19GQl9URlRfU0gxMTA2PW0KQ09ORklHX0ZCX1RGVF9TU0QxMjg5PW0KQ09ORklH
X0ZCX1RGVF9TU0QxMzA1PW0KQ09ORklHX0ZCX1RGVF9TU0QxMzA2PW0KQ09ORklHX0ZCX1RGVF9T
U0QxMzMxPW0KQ09ORklHX0ZCX1RGVF9TU0QxMzUxPW0KIyBDT05GSUdfRkJfVEZUX1NUNzczNVIg
aXMgbm90IHNldAojIENPTkZJR19GQl9URlRfU1Q3Nzg5ViBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X1RGVF9USU5ZTENEIGlzIG5vdCBzZXQKQ09ORklHX0ZCX1RGVF9UTFM4MjA0PW0KIyBDT05GSUdf
RkJfVEZUX1VDMTYxMSBpcyBub3Qgc2V0CkNPTkZJR19GQl9URlRfVUMxNzAxPW0KQ09ORklHX0ZC
X1RGVF9VUEQxNjE3MDQ9bQpDT05GSUdfRkJfVEZUX1dBVFRFUk9UVD1tCkNPTkZJR19GQl9GTEVY
PW0KIyBDT05GSUdfRkJfVEZUX0ZCVEZUX0RFVklDRSBpcyBub3Qgc2V0CkNPTkZJR19NT1NUPXkK
Q09ORklHX01PU1RfQ0RFVj15CkNPTkZJR19NT1NUX05FVD1tCiMgQ09ORklHX01PU1RfU09VTkQg
aXMgbm90IHNldApDT05GSUdfTU9TVF9WSURFTz1tCiMgQ09ORklHX01PU1RfRElNMiBpcyBub3Qg
c2V0CiMgQ09ORklHX01PU1RfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfS1M3MDEwIGlzIG5vdCBz
ZXQKQ09ORklHX0dSRVlCVVM9eQpDT05GSUdfR1JFWUJVU19BVURJTz1tCiMgQ09ORklHX0dSRVlC
VVNfQk9PVFJPTSBpcyBub3Qgc2V0CiMgQ09ORklHX0dSRVlCVVNfRklSTVdBUkUgaXMgbm90IHNl
dAojIENPTkZJR19HUkVZQlVTX0hJRCBpcyBub3Qgc2V0CkNPTkZJR19HUkVZQlVTX0xJR0hUPW0K
Q09ORklHX0dSRVlCVVNfTE9HPW0KQ09ORklHX0dSRVlCVVNfTE9PUEJBQ0s9eQojIENPTkZJR19H
UkVZQlVTX1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfR1JFWUJVU19SQVcgaXMgbm90IHNldAoj
IENPTkZJR19HUkVZQlVTX1ZJQlJBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfR1JFWUJVU19CUklE
R0VEX1BIWSBpcyBub3Qgc2V0CgojCiMgVVNCIFBvd2VyIERlbGl2ZXJ5IGFuZCBUeXBlLUMgZHJp
dmVycwojCkNPTkZJR19QSTQzMz1tCkNPTkZJR19NVEtfTU1DPW0KQ09ORklHX01US19BRUVfS0RV
TVA9eQojIENPTkZJR19NVEtfTU1DX0NEX1BPTEwgaXMgbm90IHNldAojIENPTkZJR19YODZfUExB
VEZPUk1fREVWSUNFUyBpcyBub3Qgc2V0CkNPTkZJR19QTUNfQVRPTT15CkNPTkZJR19DSFJPTUVf
UExBVEZPUk1TPXkKQ09ORklHX0NIUk9NRU9TX1BTVE9SRT15CkNPTkZJR19DUk9TX0VDX0NUTD15
CiMgQ09ORklHX0NST1NfRUNfTFBDIGlzIG5vdCBzZXQKQ09ORklHX0NST1NfRUNfUFJPVE89eQoj
IENPTkZJR19DUk9TX0tCRF9MRURfQkFDS0xJR0hUIGlzIG5vdCBzZXQKQ09ORklHX01FTExBTk9Y
X1BMQVRGT1JNPXkKIyBDT05GSUdfTUxYUkVHX0hPVFBMVUcgaXMgbm90IHNldApDT05GSUdfQ0xL
REVWX0xPT0tVUD15CkNPTkZJR19IQVZFX0NMS19QUkVQQVJFPXkKQ09ORklHX0NPTU1PTl9DTEs9
eQoKIwojIENvbW1vbiBDbG9jayBGcmFtZXdvcmsKIwpDT05GSUdfQ09NTU9OX0NMS19XTTgzMVg9
bQpDT05GSUdfQ0xLX0hTREs9eQojIENPTkZJR19DT01NT05fQ0xLX01BWDc3Njg2IGlzIG5vdCBz
ZXQKQ09ORklHX0NPTU1PTl9DTEtfU0k1MzUxPXkKIyBDT05GSUdfQ09NTU9OX0NMS19TSTUxNCBp
cyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX1NJNTQ0PW0KQ09ORklHX0NPTU1PTl9DTEtfU0k1
NzA9bQpDT05GSUdfQ09NTU9OX0NMS19DRENFNzA2PW0KQ09ORklHX0NPTU1PTl9DTEtfQ0RDRTky
NT15CiMgQ09ORklHX0NPTU1PTl9DTEtfQ1MyMDAwX0NQIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1P
Tl9DTEtfUEFMTUFTPW0KIyBDT05GSUdfQ09NTU9OX0NMS19WQzUgaXMgbm90IHNldAojIENPTkZJ
R19IV1NQSU5MT0NLIGlzIG5vdCBzZXQKCiMKIyBDbG9jayBTb3VyY2UgZHJpdmVycwojCkNPTkZJ
R19DTEtFVlRfSTgyNTM9eQpDT05GSUdfSTgyNTNfTE9DSz15CkNPTkZJR19DTEtCTERfSTgyNTM9
eQpDT05GSUdfTUFJTEJPWD15CkNPTkZJR19QTEFURk9STV9NSFU9bQojIENPTkZJR19QQ0MgaXMg
bm90IHNldApDT05GSUdfQUxURVJBX01CT1g9bQojIENPTkZJR19NQUlMQk9YX1RFU1QgaXMgbm90
IHNldApDT05GSUdfSU9NTVVfU1VQUE9SVD15CgojCiMgR2VuZXJpYyBJT01NVSBQYWdldGFibGUg
U3VwcG9ydAojCkNPTkZJR19JT01NVV9JT1ZBPW0KIyBDT05GSUdfQU1EX0lPTU1VIGlzIG5vdCBz
ZXQKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwpDT05GSUdfUkVNT1RFUFJPQz15CgojCiMgUnBt
c2cgZHJpdmVycwojCkNPTkZJR19SUE1TRz1tCkNPTkZJR19SUE1TR19DSEFSPW0KQ09ORklHX1JQ
TVNHX1FDT01fR0xJTktfTkFUSVZFPW0KQ09ORklHX1JQTVNHX1FDT01fR0xJTktfUlBNPW0KQ09O
RklHX1JQTVNHX1ZJUlRJTz1tCkNPTkZJR19TT1VORFdJUkU9eQoKIwojIFNvdW5kV2lyZSBEZXZp
Y2VzCiMKIyBDT05GSUdfU09VTkRXSVJFX0lOVEVMIGlzIG5vdCBzZXQKCiMKIyBTT0MgKFN5c3Rl
bSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2ZXJzCiMK
CiMKIyBCcm9hZGNvbSBTb0MgZHJpdmVycwojCgojCiMgaS5NWCBTb0MgZHJpdmVycwojCgojCiMg
UXVhbGNvbW0gU29DIGRyaXZlcnMKIwojIENPTkZJR19TT0NfVEkgaXMgbm90IHNldAoKIwojIFhp
bGlueCBTb0MgZHJpdmVycwojCkNPTkZJR19YSUxJTlhfVkNVPW0KQ09ORklHX1BNX0RFVkZSRVE9
eQoKIwojIERFVkZSRVEgR292ZXJub3JzCiMKQ09ORklHX0RFVkZSRVFfR09WX1NJTVBMRV9PTkRF
TUFORD15CkNPTkZJR19ERVZGUkVRX0dPVl9QRVJGT1JNQU5DRT1tCkNPTkZJR19ERVZGUkVRX0dP
Vl9QT1dFUlNBVkU9eQpDT05GSUdfREVWRlJFUV9HT1ZfVVNFUlNQQUNFPW0KIyBDT05GSUdfREVW
RlJFUV9HT1ZfUEFTU0lWRSBpcyBub3Qgc2V0CgojCiMgREVWRlJFUSBEcml2ZXJzCiMKIyBDT05G
SUdfUE1fREVWRlJFUV9FVkVOVCBpcyBub3Qgc2V0CkNPTkZJR19FWFRDT049bQoKIwojIEV4dGNv
biBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19FWFRDT05fQURDX0pBQ0s9bQojIENPTkZJR19FWFRD
T05fQVJJWk9OQSBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTl9BWFAyODggaXMgbm90IHNldAoj
IENPTkZJR19FWFRDT05fR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTl9JTlRFTF9JTlQz
NDk2IGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX01BWDE0NTc3IGlzIG5vdCBzZXQKIyBDT05G
SUdfRVhUQ09OX01BWDMzNTUgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fTUFYNzc2OTMgaXMg
bm90IHNldApDT05GSUdfRVhUQ09OX1BBTE1BUz1tCkNPTkZJR19FWFRDT05fUlQ4OTczQT1tCkNP
TkZJR19FWFRDT05fU001NTAyPW0KQ09ORklHX0VYVENPTl9VU0JfR1BJTz1tCkNPTkZJR19FWFRD
T05fVVNCQ19DUk9TX0VDPW0KQ09ORklHX01FTU9SWT15CkNPTkZJR19JSU89bQpDT05GSUdfSUlP
X0JVRkZFUj15CkNPTkZJR19JSU9fQlVGRkVSX0NCPW0KQ09ORklHX0lJT19CVUZGRVJfSFdfQ09O
U1VNRVI9bQpDT05GSUdfSUlPX0tGSUZPX0JVRj1tCkNPTkZJR19JSU9fVFJJR0dFUkVEX0JVRkZF
Uj1tCkNPTkZJR19JSU9fQ09ORklHRlM9bQpDT05GSUdfSUlPX1RSSUdHRVI9eQpDT05GSUdfSUlP
X0NPTlNVTUVSU19QRVJfVFJJR0dFUj0yCiMgQ09ORklHX0lJT19TV19ERVZJQ0UgaXMgbm90IHNl
dApDT05GSUdfSUlPX1NXX1RSSUdHRVI9bQoKIwojIEFjY2VsZXJvbWV0ZXJzCiMKQ09ORklHX0FE
WEwzNDU9bQpDT05GSUdfQURYTDM0NV9JMkM9bQpDT05GSUdfQURYTDM0NV9TUEk9bQpDT05GSUdf
Qk1BMTgwPW0KQ09ORklHX0JNQTIyMD1tCkNPTkZJR19CTUMxNTBfQUNDRUw9bQpDT05GSUdfQk1D
MTUwX0FDQ0VMX0kyQz1tCkNPTkZJR19CTUMxNTBfQUNDRUxfU1BJPW0KQ09ORklHX0RBMjgwPW0K
Q09ORklHX0RBMzExPW0KQ09ORklHX0RNQVJEMDY9bQpDT05GSUdfRE1BUkQwOT1tCiMgQ09ORklH
X0RNQVJEMTAgaXMgbm90IHNldAojIENPTkZJR19JSU9fQ1JPU19FQ19BQ0NFTF9MRUdBQ1kgaXMg
bm90IHNldApDT05GSUdfSUlPX1NUX0FDQ0VMXzNBWElTPW0KQ09ORklHX0lJT19TVF9BQ0NFTF9J
MkNfM0FYSVM9bQpDT05GSUdfSUlPX1NUX0FDQ0VMX1NQSV8zQVhJUz1tCkNPTkZJR19LWFNEOT1t
CkNPTkZJR19LWFNEOV9TUEk9bQpDT05GSUdfS1hTRDlfSTJDPW0KIyBDT05GSUdfS1hDSksxMDEz
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUMzMjMwIGlzIG5vdCBzZXQKQ09ORklHX01NQTc0NTU9bQpD
T05GSUdfTU1BNzQ1NV9JMkM9bQojIENPTkZJR19NTUE3NDU1X1NQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX01NQTc2NjAgaXMgbm90IHNldApDT05GSUdfTU1BODQ1Mj1tCkNPTkZJR19NTUE5NTUxX0NP
UkU9bQpDT05GSUdfTU1BOTU1MT1tCkNPTkZJR19NTUE5NTUzPW0KIyBDT05GSUdfTVhDNDAwNSBp
cyBub3Qgc2V0CiMgQ09ORklHX01YQzYyNTUgaXMgbm90IHNldAojIENPTkZJR19TQ0EzMDAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1RLODMxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUSzhCQTUwIGlz
IG5vdCBzZXQKCiMKIyBBbmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKQ09ORklHX0FEX1NJ
R01BX0RFTFRBPW0KIyBDT05GSUdfQUQ3MjY2IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MjkxIGlz
IG5vdCBzZXQKIyBDT05GSUdfQUQ3Mjk4IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NDc2IGlzIG5v
dCBzZXQKIyBDT05GSUdfQUQ3NzY2IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NzkxIGlzIG5vdCBz
ZXQKQ09ORklHX0FENzc5Mz1tCkNPTkZJR19BRDc4ODc9bQpDT05GSUdfQUQ3OTIzPW0KIyBDT05G
SUdfQUQ3OTlYIGlzIG5vdCBzZXQKQ09ORklHX0FYUDIwWF9BREM9bQpDT05GSUdfQVhQMjg4X0FE
Qz1tCkNPTkZJR19DQzEwMDAxX0FEQz1tCkNPTkZJR19EQTkxNTBfR1BBREM9bQojIENPTkZJR19F
TlZFTE9QRV9ERVRFQ1RPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJODQzNSBpcyBub3Qgc2V0CkNP
TkZJR19IWDcxMT1tCkNPTkZJR19JTkEyWFhfQURDPW0KIyBDT05GSUdfTFA4Nzg4X0FEQyBpcyBu
b3Qgc2V0CkNPTkZJR19MVEMyNDcxPW0KIyBDT05GSUdfTFRDMjQ4NSBpcyBub3Qgc2V0CkNPTkZJ
R19MVEMyNDk3PW0KIyBDT05GSUdfTUFYMTAyNyBpcyBub3Qgc2V0CkNPTkZJR19NQVgxMTEwMD1t
CkNPTkZJR19NQVgxMTE4PW0KQ09ORklHX01BWDEzNjM9bQojIENPTkZJR19NQVg5NjExIGlzIG5v
dCBzZXQKQ09ORklHX01DUDMyMFg9bQpDT05GSUdfTUNQMzQyMj1tCiMgQ09ORklHX01FTl9aMTg4
X0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX05BVTc4MDIgaXMgbm90IHNldApDT05GSUdfUEFMTUFT
X0dQQURDPW0KQ09ORklHX1FDT01fU1BNSV9JQURDPW0KIyBDT05GSUdfUUNPTV9TUE1JX1ZBREMg
aXMgbm90IHNldApDT05GSUdfU0RfQURDX01PRFVMQVRPUj1tCiMgQ09ORklHX1NUWDEwNCBpcyBu
b3Qgc2V0CkNPTkZJR19USV9BREMwODFDPW0KQ09ORklHX1RJX0FEQzA4MzI9bQojIENPTkZJR19U
SV9BREMwODRTMDIxIGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURDMTIxMzggaXMgbm90IHNldApD
T05GSUdfVElfQURDMTA4UzEwMj1tCkNPTkZJR19USV9BREMxMjhTMDUyPW0KIyBDT05GSUdfVElf
QURDMTYxUzYyNiBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEUzc5NTAgaXMgbm90IHNldAojIENP
TkZJR19USV9BRFM4Njg4IGlzIG5vdCBzZXQKQ09ORklHX1RJX1RMQzQ1NDE9bQpDT05GSUdfVkY2
MTBfQURDPW0KCiMKIyBBbXBsaWZpZXJzCiMKQ09ORklHX0FEODM2Nj1tCgojCiMgQ2hlbWljYWwg
U2Vuc29ycwojCiMgQ09ORklHX0FUTEFTX1BIX1NFTlNPUiBpcyBub3Qgc2V0CkNPTkZJR19DQ1M4
MTE9bQpDT05GSUdfSUFRQ09SRT1tCkNPTkZJR19WWjg5WD1tCkNPTkZJR19JSU9fQ1JPU19FQ19T
RU5TT1JTX0NPUkU9bQpDT05GSUdfSUlPX0NST1NfRUNfU0VOU09SUz1tCgojCiMgSGlkIFNlbnNv
ciBJSU8gQ29tbW9uCiMKQ09ORklHX0lJT19NU19TRU5TT1JTX0kyQz1tCgojCiMgU1NQIFNlbnNv
ciBDb21tb24KIwojIENPTkZJR19JSU9fU1NQX1NFTlNPUlNfQ09NTU9OUyBpcyBub3Qgc2V0CkNP
TkZJR19JSU9fU1NQX1NFTlNPUkhVQj1tCkNPTkZJR19JSU9fU1RfU0VOU09SU19JMkM9bQpDT05G
SUdfSUlPX1NUX1NFTlNPUlNfU1BJPW0KQ09ORklHX0lJT19TVF9TRU5TT1JTX0NPUkU9bQoKIwoj
IENvdW50ZXJzCiMKIyBDT05GSUdfMTA0X1FVQURfOCBpcyBub3Qgc2V0CgojCiMgRGlnaXRhbCB0
byBhbmFsb2cgY29udmVydGVycwojCiMgQ09ORklHX0FENTA2NCBpcyBub3Qgc2V0CiMgQ09ORklH
X0FENTM2MCBpcyBub3Qgc2V0CkNPTkZJR19BRDUzODA9bQpDT05GSUdfQUQ1NDIxPW0KQ09ORklH
X0FENTQ0Nj1tCkNPTkZJR19BRDU0NDk9bQpDT05GSUdfQUQ1NTkyUl9CQVNFPW0KQ09ORklHX0FE
NTU5MlI9bQojIENPTkZJR19BRDU1OTNSIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NTA0IGlzIG5v
dCBzZXQKIyBDT05GSUdfQUQ1NjI0Ul9TUEkgaXMgbm90IHNldApDT05GSUdfTFRDMjYzMj1tCiMg
Q09ORklHX0FENTY4NiBpcyBub3Qgc2V0CkNPTkZJR19BRDU3NTU9bQojIENPTkZJR19BRDU3NjEg
aXMgbm90IHNldAojIENPTkZJR19BRDU3NjQgaXMgbm90IHNldApDT05GSUdfQUQ1NzkxPW0KQ09O
RklHX0FENzMwMz1tCkNPTkZJR19DSU9fREFDPW0KQ09ORklHX0FEODgwMT1tCkNPTkZJR19EUE9U
X0RBQz1tCkNPTkZJR19EUzQ0MjQ9bQpDT05GSUdfTTYyMzMyPW0KQ09ORklHX01BWDUxNz1tCkNP
TkZJR19NQVg1ODIxPW0KQ09ORklHX01DUDQ3MjU9bQojIENPTkZJR19NQ1A0OTIyIGlzIG5vdCBz
ZXQKQ09ORklHX1RJX0RBQzA4MlMwODU9bQpDT05GSUdfVkY2MTBfREFDPW0KCiMKIyBJSU8gZHVt
bXkgZHJpdmVyCiMKCiMKIyBGcmVxdWVuY3kgU3ludGhlc2l6ZXJzIEREUy9QTEwKIwoKIwojIENs
b2NrIEdlbmVyYXRvci9EaXN0cmlidXRpb24KIwojIENPTkZJR19BRDk1MjMgaXMgbm90IHNldAoK
IwojIFBoYXNlLUxvY2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIwpDT05G
SUdfQURGNDM1MD1tCgojCiMgRGlnaXRhbCBneXJvc2NvcGUgc2Vuc29ycwojCiMgQ09ORklHX0FE
SVMxNjA4MCBpcyBub3Qgc2V0CkNPTkZJR19BRElTMTYxMzA9bQpDT05GSUdfQURJUzE2MTM2PW0K
Q09ORklHX0FESVMxNjI2MD1tCiMgQ09ORklHX0FEWFJTNDUwIGlzIG5vdCBzZXQKQ09ORklHX0JN
RzE2MD1tCkNPTkZJR19CTUcxNjBfSTJDPW0KQ09ORklHX0JNRzE2MF9TUEk9bQpDT05GSUdfTVBV
MzA1MD1tCkNPTkZJR19NUFUzMDUwX0kyQz1tCkNPTkZJR19JSU9fU1RfR1lST18zQVhJUz1tCkNP
TkZJR19JSU9fU1RfR1lST19JMkNfM0FYSVM9bQpDT05GSUdfSUlPX1NUX0dZUk9fU1BJXzNBWElT
PW0KQ09ORklHX0lURzMyMDA9bQoKIwojIEhlYWx0aCBTZW5zb3JzCiMKCiMKIyBIZWFydCBSYXRl
IE1vbml0b3JzCiMKQ09ORklHX0FGRTQ0MDM9bQojIENPTkZJR19BRkU0NDA0IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUFYMzAxMDAgaXMgbm90IHNldApDT05GSUdfTUFYMzAxMDI9bQoKIwojIEh1bWlk
aXR5IHNlbnNvcnMKIwpDT05GSUdfQU0yMzE1PW0KQ09ORklHX0RIVDExPW0KQ09ORklHX0hEQzEw
MFg9bQpDT05GSUdfSFRTMjIxPW0KQ09ORklHX0hUUzIyMV9JMkM9bQpDT05GSUdfSFRTMjIxX1NQ
ST1tCkNPTkZJR19IVFUyMT1tCkNPTkZJR19TSTcwMDU9bQpDT05GSUdfU0k3MDIwPW0KCiMKIyBJ
bmVydGlhbCBtZWFzdXJlbWVudCB1bml0cwojCkNPTkZJR19BRElTMTY0MDA9bQojIENPTkZJR19B
RElTMTY0ODAgaXMgbm90IHNldAojIENPTkZJR19CTUkxNjBfSTJDIGlzIG5vdCBzZXQKIyBDT05G
SUdfQk1JMTYwX1NQSSBpcyBub3Qgc2V0CkNPTkZJR19LTVg2MT1tCkNPTkZJR19JTlZfTVBVNjA1
MF9JSU89bQojIENPTkZJR19JTlZfTVBVNjA1MF9JMkMgaXMgbm90IHNldApDT05GSUdfSU5WX01Q
VTYwNTBfU1BJPW0KQ09ORklHX0lJT19TVF9MU002RFNYPW0KQ09ORklHX0lJT19TVF9MU002RFNY
X0kyQz1tCkNPTkZJR19JSU9fU1RfTFNNNkRTWF9TUEk9bQpDT05GSUdfSUlPX0FESVNfTElCPW0K
Q09ORklHX0lJT19BRElTX0xJQl9CVUZGRVI9eQoKIwojIExpZ2h0IHNlbnNvcnMKIwojIENPTkZJ
R19BQ1BJX0FMUyBpcyBub3Qgc2V0CkNPTkZJR19BREpEX1MzMTE9bQpDT05GSUdfQUwzMzIwQT1t
CiMgQ09ORklHX0FQRFM5MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBEUzk5NjAgaXMgbm90IHNl
dApDT05GSUdfQkgxNzUwPW0KQ09ORklHX0JIMTc4MD1tCkNPTkZJR19DTTMyMTgxPW0KQ09ORklH
X0NNMzIzMj1tCiMgQ09ORklHX0NNMzMyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNMzYwNSBpcyBu
b3Qgc2V0CkNPTkZJR19DTTM2NjUxPW0KQ09ORklHX0lJT19DUk9TX0VDX0xJR0hUX1BST1g9bQpD
T05GSUdfR1AyQVAwMjBBMDBGPW0KQ09ORklHX1NFTlNPUlNfSVNMMjkwMTg9bQpDT05GSUdfU0VO
U09SU19JU0wyOTAyOD1tCkNPTkZJR19JU0wyOTEyNT1tCiMgQ09ORklHX0pTQTEyMTIgaXMgbm90
IHNldApDT05GSUdfUlBSMDUyMT1tCkNPTkZJR19TRU5TT1JTX0xNMzUzMz1tCiMgQ09ORklHX0xU
UjUwMSBpcyBub3Qgc2V0CkNPTkZJR19MVjAxMDRDUz1tCkNPTkZJR19NQVg0NDAwMD1tCkNPTkZJ
R19PUFQzMDAxPW0KQ09ORklHX1BBMTIyMDMwMDE9bQpDT05GSUdfU0kxMTQ1PW0KQ09ORklHX1NU
SzMzMTA9bQojIENPTkZJR19TVF9VVklTMjUgaXMgbm90IHNldApDT05GSUdfVENTMzQxND1tCkNP
TkZJR19UQ1MzNDcyPW0KIyBDT05GSUdfU0VOU09SU19UU0wyNTYzIGlzIG5vdCBzZXQKIyBDT05G
SUdfVFNMMjU4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1RTTDQ1MzEgaXMgbm90IHNldAojIENPTkZJ
R19VUzUxODJEIGlzIG5vdCBzZXQKQ09ORklHX1ZDTkw0MDAwPW0KIyBDT05GSUdfVkVNTDYwNzAg
aXMgbm90IHNldAojIENPTkZJR19WTDYxODAgaXMgbm90IHNldApDT05GSUdfWk9QVDIyMDE9bQoK
IwojIE1hZ25ldG9tZXRlciBzZW5zb3JzCiMKQ09ORklHX0FLODk3ND1tCkNPTkZJR19BSzg5NzU9
bQpDT05GSUdfQUswOTkxMT1tCiMgQ09ORklHX0JNQzE1MF9NQUdOX0kyQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0JNQzE1MF9NQUdOX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX01BRzMxMTAgaXMgbm90
IHNldAojIENPTkZJR19NTUMzNTI0MCBpcyBub3Qgc2V0CkNPTkZJR19JSU9fU1RfTUFHTl8zQVhJ
Uz1tCkNPTkZJR19JSU9fU1RfTUFHTl9JMkNfM0FYSVM9bQpDT05GSUdfSUlPX1NUX01BR05fU1BJ
XzNBWElTPW0KQ09ORklHX1NFTlNPUlNfSE1DNTg0Mz1tCkNPTkZJR19TRU5TT1JTX0hNQzU4NDNf
STJDPW0KQ09ORklHX1NFTlNPUlNfSE1DNTg0M19TUEk9bQoKIwojIE11bHRpcGxleGVycwojCiMg
Q09ORklHX0lJT19NVVggaXMgbm90IHNldAoKIwojIEluY2xpbm9tZXRlciBzZW5zb3JzCiMKCiMK
IyBUcmlnZ2VycyAtIHN0YW5kYWxvbmUKIwpDT05GSUdfSUlPX0hSVElNRVJfVFJJR0dFUj1tCkNP
TkZJR19JSU9fSU5URVJSVVBUX1RSSUdHRVI9bQpDT05GSUdfSUlPX1RJR0hUTE9PUF9UUklHR0VS
PW0KIyBDT05GSUdfSUlPX1NZU0ZTX1RSSUdHRVIgaXMgbm90IHNldAoKIwojIERpZ2l0YWwgcG90
ZW50aW9tZXRlcnMKIwpDT05GSUdfQUQ1MjcyPW0KIyBDT05GSUdfRFMxODAzIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUFYNTQ4MSBpcyBub3Qgc2V0CkNPTkZJR19NQVg1NDg3PW0KQ09ORklHX01DUDQw
MTg9bQpDT05GSUdfTUNQNDEzMT1tCkNPTkZJR19NQ1A0NTMxPW0KQ09ORklHX1RQTDAxMDI9bQoK
IwojIERpZ2l0YWwgcG90ZW50aW9zdGF0cwojCiMgQ09ORklHX0xNUDkxMDAwIGlzIG5vdCBzZXQK
CiMKIyBQcmVzc3VyZSBzZW5zb3JzCiMKQ09ORklHX0FCUDA2ME1HPW0KQ09ORklHX0JNUDI4MD1t
CkNPTkZJR19CTVAyODBfSTJDPW0KQ09ORklHX0JNUDI4MF9TUEk9bQpDT05GSUdfSUlPX0NST1Nf
RUNfQkFSTz1tCkNPTkZJR19IUDAzPW0KQ09ORklHX01QTDExNT1tCiMgQ09ORklHX01QTDExNV9J
MkMgaXMgbm90IHNldApDT05GSUdfTVBMMTE1X1NQST1tCiMgQ09ORklHX01QTDMxMTUgaXMgbm90
IHNldAojIENPTkZJR19NUzU2MTEgaXMgbm90IHNldApDT05GSUdfTVM1NjM3PW0KQ09ORklHX0lJ
T19TVF9QUkVTUz1tCkNPTkZJR19JSU9fU1RfUFJFU1NfSTJDPW0KQ09ORklHX0lJT19TVF9QUkVT
U19TUEk9bQpDT05GSUdfVDU0MDM9bQpDT05GSUdfSFAyMDZDPW0KIyBDT05GSUdfWlBBMjMyNiBp
cyBub3Qgc2V0CgojCiMgTGlnaHRuaW5nIHNlbnNvcnMKIwpDT05GSUdfQVMzOTM1PW0KCiMKIyBQ
cm94aW1pdHkgYW5kIGRpc3RhbmNlIHNlbnNvcnMKIwpDT05GSUdfTElEQVJfTElURV9WMj1tCiMg
Q09ORklHX1JGRDc3NDAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU1JGMDQgaXMgbm90IHNldAojIENP
TkZJR19TWDk1MDAgaXMgbm90IHNldAojIENPTkZJR19TUkYwOCBpcyBub3Qgc2V0CgojCiMgVGVt
cGVyYXR1cmUgc2Vuc29ycwojCkNPTkZJR19NQVhJTV9USEVSTU9DT1VQTEU9bQpDT05GSUdfTUxY
OTA2MTQ9bQpDT05GSUdfTUxYOTA2MzI9bQpDT05GSUdfVE1QMDA2PW0KIyBDT05GSUdfVE1QMDA3
IGlzIG5vdCBzZXQKQ09ORklHX1RTWVMwMT1tCkNPTkZJR19UU1lTMDJEPW0KQ09ORklHX05UQj15
CkNPTkZJR19OVEJfQU1EPW0KQ09ORklHX05UQl9JRFQ9eQojIENPTkZJR19OVEJfSU5URUwgaXMg
bm90IHNldApDT05GSUdfTlRCX1NXSVRDSFRFQz1tCiMgQ09ORklHX05UQl9QSU5HUE9ORyBpcyBu
b3Qgc2V0CkNPTkZJR19OVEJfVE9PTD15CkNPTkZJR19OVEJfUEVSRj1tCkNPTkZJR19OVEJfVFJB
TlNQT1JUPW0KQ09ORklHX1ZNRV9CVVM9eQoKIwojIFZNRSBCcmlkZ2UgRHJpdmVycwojCiMgQ09O
RklHX1ZNRV9DQTkxQ1g0MiBpcyBub3Qgc2V0CkNPTkZJR19WTUVfVFNJMTQ4PXkKQ09ORklHX1ZN
RV9GQUtFPXkKCiMKIyBWTUUgQm9hcmQgRHJpdmVycwojCkNPTkZJR19WTUlWTUVfNzgwNT1tCgoj
CiMgVk1FIERldmljZSBEcml2ZXJzCiMKIyBDT05GSUdfVk1FX1VTRVIgaXMgbm90IHNldAojIENP
TkZJR19QV00gaXMgbm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJ
UD15CkNPTkZJR19BUk1fR0lDX01BWF9OUj0xCkNPTkZJR19JUEFDS19CVVM9bQpDT05GSUdfQk9B
UkRfVFBDSTIwMD1tCiMgQ09ORklHX1NFUklBTF9JUE9DVEFMIGlzIG5vdCBzZXQKQ09ORklHX1JF
U0VUX0NPTlRST0xMRVI9eQojIENPTkZJR19SRVNFVF9USV9TWVNDT04gaXMgbm90IHNldApDT05G
SUdfRk1DPXkKQ09ORklHX0ZNQ19GQUtFREVWPW0KQ09ORklHX0ZNQ19UUklWSUFMPW0KQ09ORklH
X0ZNQ19XUklURV9FRVBST009eQpDT05GSUdfRk1DX0NIQVJERVY9bQoKIwojIFBIWSBTdWJzeXN0
ZW0KIwpDT05GSUdfR0VORVJJQ19QSFk9eQpDT05GSUdfQkNNX0tPTkFfVVNCMl9QSFk9eQpDT05G
SUdfUEhZX1BYQV8yOE5NX0hTSUM9eQpDT05GSUdfUEhZX1BYQV8yOE5NX1VTQjI9eQojIENPTkZJ
R19QSFlfQ1BDQVBfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01BUFBIT05FX01ETTY2MDAg
aXMgbm90IHNldAojIENPTkZJR19QT1dFUkNBUCBpcyBub3Qgc2V0CkNPTkZJR19NQ0I9eQpDT05G
SUdfTUNCX1BDST15CkNPTkZJR19NQ0JfTFBDPXkKCiMKIyBQZXJmb3JtYW5jZSBtb25pdG9yIHN1
cHBvcnQKIwojIENPTkZJR19SQVMgaXMgbm90IHNldApDT05GSUdfVEhVTkRFUkJPTFQ9bQoKIwoj
IEFuZHJvaWQKIwojIENPTkZJR19BTkRST0lEIGlzIG5vdCBzZXQKQ09ORklHX0RBWD15CkNPTkZJ
R19ERVZfREFYPXkKQ09ORklHX05WTUVNPXkKCiMKIyBIVyB0cmFjaW5nIHN1cHBvcnQKIwpDT05G
SUdfU1RNPXkKQ09ORklHX1NUTV9EVU1NWT1tCiMgQ09ORklHX1NUTV9TT1VSQ0VfQ09OU09MRSBp
cyBub3Qgc2V0CkNPTkZJR19TVE1fU09VUkNFX0hFQVJUQkVBVD15CkNPTkZJR19JTlRFTF9USD15
CiMgQ09ORklHX0lOVEVMX1RIX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1RIX0FDUEkg
aXMgbm90IHNldAojIENPTkZJR19JTlRFTF9USF9HVEggaXMgbm90IHNldAojIENPTkZJR19JTlRF
TF9USF9TVEggaXMgbm90IHNldApDT05GSUdfSU5URUxfVEhfTVNVPXkKIyBDT05GSUdfSU5URUxf
VEhfUFRJIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVMX1RIX0RFQlVHPXkKQ09ORklHX0ZQR0E9bQpD
T05GSUdfQUxURVJBX1BSX0lQX0NPUkU9bQojIENPTkZJR19BTFRFUkFfUFJfSVBfQ09SRV9QTEFU
IGlzIG5vdCBzZXQKQ09ORklHX0ZQR0FfTUdSX0FMVEVSQV9QU19TUEk9bQpDT05GSUdfRlBHQV9N
R1JfQUxURVJBX0NWUD1tCiMgQ09ORklHX0ZQR0FfTUdSX1hJTElOWF9TUEkgaXMgbm90IHNldApD
T05GSUdfRlBHQV9NR1JfSUNFNDBfU1BJPW0KIyBDT05GSUdfRlBHQV9CUklER0UgaXMgbm90IHNl
dApDT05GSUdfRlNJPW0KQ09ORklHX0ZTSV9NQVNURVJfR1BJTz1tCkNPTkZJR19GU0lfTUFTVEVS
X0hVQj1tCiMgQ09ORklHX0ZTSV9TQ09NIGlzIG5vdCBzZXQKQ09ORklHX01VTFRJUExFWEVSPXkK
CiMKIyBNdWx0aXBsZXhlciBkcml2ZXJzCiMKQ09ORklHX01VWF9BREc3OTJBPXkKQ09ORklHX01V
WF9HUElPPXkKQ09ORklHX01VWF9NTUlPPW0KQ09ORklHX1BNX09QUD15CiMgQ09ORklHX1VOSVNZ
U19WSVNPUkJVUyBpcyBub3Qgc2V0CkNPTkZJR19TSU9YPW0KQ09ORklHX1NJT1hfQlVTX0dQSU89
bQojIENPTkZJR19TTElNQlVTIGlzIG5vdCBzZXQKCiMKIyBGaXJtd2FyZSBEcml2ZXJzCiMKQ09O
RklHX0VERD15CiMgQ09ORklHX0VERF9PRkYgaXMgbm90IHNldAojIENPTkZJR19GSVJNV0FSRV9N
RU1NQVAgaXMgbm90IHNldAojIENPTkZJR19ERUxMX1JCVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RD
REJBUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTQ1NJX0lCRlRfRklORCBpcyBub3Qgc2V0CkNPTkZJ
R19GV19DRkdfU1lTRlM9eQpDT05GSUdfRldfQ0ZHX1NZU0ZTX0NNRExJTkU9eQpDT05GSUdfR09P
R0xFX0ZJUk1XQVJFPXkKQ09ORklHX0dPT0dMRV9DT1JFQk9PVF9UQUJMRT1tCiMgQ09ORklHX0dP
T0dMRV9DT1JFQk9PVF9UQUJMRV9BQ1BJIGlzIG5vdCBzZXQKQ09ORklHX0dPT0dMRV9DT1JFQk9P
VF9UQUJMRV9PRj1tCkNPTkZJR19HT09HTEVfTUVNQ09OU09MRT1tCkNPTkZJR19HT09HTEVfTUVN
Q09OU09MRV9DT1JFQk9PVD1tCkNPTkZJR19HT09HTEVfVlBEPW0KCiMKIyBUZWdyYSBmaXJtd2Fy
ZSBkcml2ZXIKIwoKIwojIEZpbGUgc3lzdGVtcwojCkNPTkZJR19EQ0FDSEVfV09SRF9BQ0NFU1M9
eQpDT05GSUdfRlNfUE9TSVhfQUNMPXkKQ09ORklHX0VYUE9SVEZTPXkKQ09ORklHX0VYUE9SVEZT
X0JMT0NLX09QUz15CkNPTkZJR19GSUxFX0xPQ0tJTkc9eQpDT05GSUdfTUFOREFUT1JZX0ZJTEVf
TE9DS0lORz15CkNPTkZJR19GU19FTkNSWVBUSU9OPXkKQ09ORklHX0ZTTk9USUZZPXkKIyBDT05G
SUdfRE5PVElGWSBpcyBub3Qgc2V0CkNPTkZJR19JTk9USUZZX1VTRVI9eQojIENPTkZJR19GQU5P
VElGWSBpcyBub3Qgc2V0CkNPTkZJR19RVU9UQT15CkNPTkZJR19RVU9UQV9ORVRMSU5LX0lOVEVS
RkFDRT15CkNPTkZJR19QUklOVF9RVU9UQV9XQVJOSU5HPXkKIyBDT05GSUdfUVVPVEFfREVCVUcg
aXMgbm90IHNldApDT05GSUdfUVVPVEFfVFJFRT1tCiMgQ09ORklHX1FGTVRfVjEgaXMgbm90IHNl
dApDT05GSUdfUUZNVF9WMj1tCkNPTkZJR19RVU9UQUNUTD15CkNPTkZJR19BVVRPRlM0X0ZTPXkK
IyBDT05GSUdfRlVTRV9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09WRVJMQVlfRlMgaXMgbm90IHNl
dAoKIwojIENhY2hlcwojCkNPTkZJR19GU0NBQ0hFPW0KIyBDT05GSUdfRlNDQUNIRV9TVEFUUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZTQ0FDSEVfSElTVE9HUkFNIGlzIG5vdCBzZXQKQ09ORklHX0ZT
Q0FDSEVfREVCVUc9eQojIENPTkZJR19GU0NBQ0hFX09CSkVDVF9MSVNUIGlzIG5vdCBzZXQKCiMK
IyBQc2V1ZG8gZmlsZXN5c3RlbXMKIwpDT05GSUdfUFJPQ19GUz15CiMgQ09ORklHX1BST0NfS0NP
UkUgaXMgbm90IHNldApDT05GSUdfUFJPQ19WTUNPUkU9eQpDT05GSUdfUFJPQ19TWVNDVEw9eQpD
T05GSUdfUFJPQ19QQUdFX01PTklUT1I9eQpDT05GSUdfUFJPQ19DSElMRFJFTj15CkNPTkZJR19L
RVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05GSUdfVE1QRlM9eQojIENPTkZJR19UTVBGU19QT1NJ
WF9BQ0wgaXMgbm90IHNldAojIENPTkZJR19UTVBGU19YQVRUUiBpcyBub3Qgc2V0CiMgQ09ORklH
X0hVR0VUTEJGUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFPXkKQ09O
RklHX0NPTkZJR0ZTX0ZTPXkKQ09ORklHX01JU0NfRklMRVNZU1RFTVM9eQpDT05GSUdfT1JBTkdF
RlNfRlM9bQpDT05GSUdfRUNSWVBUX0ZTPXkKQ09ORklHX0VDUllQVF9GU19NRVNTQUdJTkc9eQpD
T05GSUdfSkZGUzJfRlM9eQpDT05GSUdfSkZGUzJfRlNfREVCVUc9MAojIENPTkZJR19KRkZTMl9G
U19XUklURUJVRkZFUiBpcyBub3Qgc2V0CkNPTkZJR19KRkZTMl9TVU1NQVJZPXkKQ09ORklHX0pG
RlMyX0ZTX1hBVFRSPXkKQ09ORklHX0pGRlMyX0ZTX1BPU0lYX0FDTD15CiMgQ09ORklHX0pGRlMy
X0ZTX1NFQ1VSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfSkZGUzJfQ09NUFJFU1NJT05fT1BUSU9O
UyBpcyBub3Qgc2V0CkNPTkZJR19KRkZTMl9aTElCPXkKQ09ORklHX0pGRlMyX1JUSU1FPXkKQ09O
RklHX1VCSUZTX0ZTPW0KQ09ORklHX1VCSUZTX0ZTX0FEVkFOQ0VEX0NPTVBSPXkKQ09ORklHX1VC
SUZTX0ZTX0xaTz15CkNPTkZJR19VQklGU19GU19aTElCPXkKQ09ORklHX1VCSUZTX0FUSU1FX1NV
UFBPUlQ9eQpDT05GSUdfVUJJRlNfRlNfU0VDVVJJVFk9eQpDT05GSUdfQ1JBTUZTPW0KQ09ORklH
X0NSQU1GU19NVEQ9eQojIENPTkZJR19ST01GU19GUyBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkU9
eQpDT05GSUdfUFNUT1JFX0RFRkxBVEVfQ09NUFJFU1M9bQpDT05GSUdfUFNUT1JFX0xaT19DT01Q
UkVTUz15CkNPTkZJR19QU1RPUkVfTFo0X0NPTVBSRVNTPW0KQ09ORklHX1BTVE9SRV9MWjRIQ19D
T01QUkVTUz15CkNPTkZJR19QU1RPUkVfODQyX0NPTVBSRVNTPXkKQ09ORklHX1BTVE9SRV9DT01Q
UkVTUz15CiMgQ09ORklHX1BTVE9SRV9ERUZMQVRFX0NPTVBSRVNTX0RFRkFVTFQgaXMgbm90IHNl
dAojIENPTkZJR19QU1RPUkVfTFpPX0NPTVBSRVNTX0RFRkFVTFQgaXMgbm90IHNldAojIENPTkZJ
R19QU1RPUkVfTFo0X0NPTVBSRVNTX0RFRkFVTFQgaXMgbm90IHNldAojIENPTkZJR19QU1RPUkVf
TFo0SENfQ09NUFJFU1NfREVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkVfODQyX0NPTVBS
RVNTX0RFRkFVTFQ9eQpDT05GSUdfUFNUT1JFX0NPTVBSRVNTX0RFRkFVTFQ9Ijg0MiIKIyBDT05G
SUdfUFNUT1JFX0NPTlNPTEUgaXMgbm90IHNldApDT05GSUdfUFNUT1JFX1BNU0c9eQpDT05GSUdf
UFNUT1JFX1JBTT15CkNPTkZJR19ORVRXT1JLX0ZJTEVTWVNURU1TPXkKQ09ORklHX05GU19GUz15
CkNPTkZJR19ORlNfVjI9eQpDT05GSUdfTkZTX1YzPXkKIyBDT05GSUdfTkZTX1YzX0FDTCBpcyBu
b3Qgc2V0CkNPTkZJR19ORlNfVjQ9bQojIENPTkZJR19ORlNfU1dBUCBpcyBub3Qgc2V0CiMgQ09O
RklHX05GU19WNF8xIGlzIG5vdCBzZXQKIyBDT05GSUdfUk9PVF9ORlMgaXMgbm90IHNldAojIENP
TkZJR19ORlNfVVNFX0xFR0FDWV9ETlMgaXMgbm90IHNldApDT05GSUdfTkZTX1VTRV9LRVJORUxf
RE5TPXkKIyBDT05GSUdfTkZTRCBpcyBub3Qgc2V0CkNPTkZJR19HUkFDRV9QRVJJT0Q9eQpDT05G
SUdfTE9DS0Q9eQpDT05GSUdfTE9DS0RfVjQ9eQpDT05GSUdfTkZTX0NPTU1PTj15CkNPTkZJR19T
VU5SUEM9eQpDT05GSUdfU1VOUlBDX0dTUz1tCkNPTkZJR19SUENTRUNfR1NTX0tSQjU9bQojIENP
TkZJR19TVU5SUENfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19DRVBIX0ZTIGlzIG5vdCBzZXQK
Q09ORklHX0NJRlM9bQojIENPTkZJR19DSUZTX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0lG
U19XRUFLX1BXX0hBU0ggaXMgbm90IHNldAojIENPTkZJR19DSUZTX1VQQ0FMTCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NJRlNfWEFUVFIgaXMgbm90IHNldApDT05GSUdfQ0lGU19ERUJVRz15CiMgQ09O
RklHX0NJRlNfREVCVUcyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0lGU19ERUJVR19EVU1QX0tFWVMg
aXMgbm90IHNldAojIENPTkZJR19DSUZTX0RGU19VUENBTEwgaXMgbm90IHNldAojIENPTkZJR19D
SUZTX1NNQjMxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NJRlNfRlNDQUNIRSBpcyBub3Qgc2V0CiMg
Q09ORklHX0NPREFfRlMgaXMgbm90IHNldAojIENPTkZJR19BRlNfRlMgaXMgbm90IHNldAojIENP
TkZJR185UF9GUyBpcyBub3Qgc2V0CkNPTkZJR19OTFM9eQpDT05GSUdfTkxTX0RFRkFVTFQ9Imlz
bzg4NTktMSIKIyBDT05GSUdfTkxTX0NPREVQQUdFXzQzNyBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19DT0RFUEFHRV83MzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfNzc1IGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1MCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19D
T0RFUEFHRV84NTIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODU1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1NyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RF
UEFHRV84NjAgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYxIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFH
RV84NjMgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY0IGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX0NPREVQQUdFXzg2NSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84
NjYgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY5IGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0NPREVQQUdFXzkzNiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85NTAg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTMyIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkxTX0NPREVQQUdFXzk0OSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NzQgaXMg
bm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV84IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NP
REVQQUdFXzEyNTAgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfMTI1MSBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19BU0NJSSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzEg
aXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8yIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X0lTTzg4NTlfMyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNiBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNldAojIENPTkZJR19OTFNf
SVNPODg1OV85IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfSVNPODg1OV8xNCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzE1
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0tPSThfUiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19L
T0k4X1UgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX01BQ19DRUxUSUMgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0NFTlRFVVJPIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DUk9BVElBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19NQUNfQ1lSSUxMSUMgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0dBRUxJQyBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19NQUNfR1JFRUsgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0lD
RUxBTkQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0lOVUlUIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX01BQ19ST01BTklBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfVFVSS0lTSCBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19VVEY4IGlzIG5vdCBzZXQKIyBDT05GSUdfRExNIGlzIG5v
dCBzZXQKCiMKIyBLZXJuZWwgaGFja2luZwojCkNPTkZJR19UUkFDRV9JUlFGTEFHU19TVVBQT1JU
PXkKCiMKIyBwcmludGsgYW5kIGRtZXNnIG9wdGlvbnMKIwpDT05GSUdfUFJJTlRLX1RJTUU9eQpD
T05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcKQ09ORklHX01FU1NBR0VfTE9HTEVWRUxf
REVGQVVMVD00CkNPTkZJR19CT09UX1BSSU5US19ERUxBWT15CiMgQ09ORklHX0RZTkFNSUNfREVC
VUcgaXMgbm90IHNldAoKIwojIENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlv
bnMKIwpDT05GSUdfREVCVUdfSU5GTz15CkNPTkZJR19ERUJVR19JTkZPX1JFRFVDRUQ9eQojIENP
TkZJR19ERUJVR19JTkZPX1NQTElUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FS
RjQgaXMgbm90IHNldAojIENPTkZJR19HREJfU0NSSVBUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VO
QUJMRV9XQVJOX0RFUFJFQ0FURUQgaXMgbm90IHNldApDT05GSUdfRU5BQkxFX01VU1RfQ0hFQ0s9
eQpDT05GSUdfRlJBTUVfV0FSTj0yMDQ4CiMgQ09ORklHX1NUUklQX0FTTV9TWU1TIGlzIG5vdCBz
ZXQKQ09ORklHX1JFQURBQkxFX0FTTT15CkNPTkZJR19VTlVTRURfU1lNQk9MUz15CiMgQ09ORklH
X1BBR0VfT1dORVIgaXMgbm90IHNldApDT05GSUdfREVCVUdfRlM9eQpDT05GSUdfSEVBREVSU19D
SEVDSz15CkNPTkZJR19ERUJVR19TRUNUSU9OX01JU01BVENIPXkKQ09ORklHX1NFQ1RJT05fTUlT
TUFUQ0hfV0FSTl9PTkxZPXkKQ09ORklHX0ZSQU1FX1BPSU5URVI9eQpDT05GSUdfU1RBQ0tfVkFM
SURBVElPTj15CkNPTkZJR19ERUJVR19GT1JDRV9XRUFLX1BFUl9DUFU9eQpDT05GSUdfTUFHSUNf
U1lTUlE9eQpDT05GSUdfTUFHSUNfU1lTUlFfREVGQVVMVF9FTkFCTEU9MHgxCkNPTkZJR19NQUdJ
Q19TWVNSUV9TRVJJQUw9eQpDT05GSUdfREVCVUdfS0VSTkVMPXkKCiMKIyBNZW1vcnkgRGVidWdn
aW5nCiMKIyBDT05GSUdfUEFHRV9FWFRFTlNJT04gaXMgbm90IHNldAojIENPTkZJR19ERUJVR19Q
QUdFQUxMT0MgaXMgbm90IHNldApDT05GSUdfUEFHRV9QT0lTT05JTkc9eQojIENPTkZJR19QQUdF
X1BPSVNPTklOR19OT19TQU5JVFkgaXMgbm90IHNldAojIENPTkZJR19QQUdFX1BPSVNPTklOR19a
RVJPIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1JPREFUQV9URVNUPXkKIyBDT05GSUdfREVCVUdf
T0JKRUNUUyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0RFQlVHX0tNRU1MRUFLPXkKIyBDT05GSUdf
REVCVUdfS01FTUxFQUsgaXMgbm90IHNldApDT05GSUdfREVCVUdfU1RBQ0tfVVNBR0U9eQpDT05G
SUdfREVCVUdfVk09eQpDT05GSUdfREVCVUdfVk1fVk1BQ0FDSEU9eQojIENPTkZJR19ERUJVR19W
TV9SQiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1ZNX1BHRkxBR1MgaXMgbm90IHNldApDT05G
SUdfQVJDSF9IQVNfREVCVUdfVklSVFVBTD15CiMgQ09ORklHX0RFQlVHX1ZJUlRVQUwgaXMgbm90
IHNldApDT05GSUdfREVCVUdfTUVNT1JZX0lOSVQ9eQpDT05GSUdfSEFWRV9ERUJVR19TVEFDS09W
RVJGTE9XPXkKQ09ORklHX0RFQlVHX1NUQUNLT1ZFUkZMT1c9eQpDT05GSUdfSEFWRV9BUkNIX0tB
U0FOPXkKQ09ORklHX0FSQ0hfSEFTX0tDT1Y9eQojIENPTkZJR19LQ09WIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfU0hJUlEgaXMgbm90IHNldAoKIwojIERlYnVnIExvY2t1cHMgYW5kIEhhbmdz
CiMKQ09ORklHX0xPQ0tVUF9ERVRFQ1RPUj15CkNPTkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SPXkK
Q09ORklHX0JPT1RQQVJBTV9TT0ZUTE9DS1VQX1BBTklDPXkKQ09ORklHX0JPT1RQQVJBTV9TT0ZU
TE9DS1VQX1BBTklDX1ZBTFVFPTEKQ09ORklHX0hBUkRMT0NLVVBfQ0hFQ0tfVElNRVNUQU1QPXkK
IyBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFVEVDVF9I
VU5HX1RBU0sgaXMgbm90IHNldAojIENPTkZJR19XUV9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09O
RklHX1BBTklDX09OX09PUFMgaXMgbm90IHNldApDT05GSUdfUEFOSUNfT05fT09QU19WQUxVRT0w
CkNPTkZJR19QQU5JQ19USU1FT1VUPTAKQ09ORklHX1NDSEVEX0RFQlVHPXkKQ09ORklHX1NDSEVE
X0lORk89eQojIENPTkZJR19TQ0hFRFNUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfU1RB
Q0tfRU5EX0NIRUNLIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1RJTUVLRUVQSU5HPXkKCiMKIyBM
b2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCiMKQ09ORklHX0xPQ0tf
REVCVUdHSU5HX1NVUFBPUlQ9eQpDT05GSUdfUFJPVkVfTE9DS0lORz15CkNPTkZJR19MT0NLX1NU
QVQ9eQpDT05GSUdfREVCVUdfUlRfTVVURVhFUz15CkNPTkZJR19ERUJVR19TUElOTE9DSz15CkNP
TkZJR19ERUJVR19NVVRFWEVTPXkKQ09ORklHX0RFQlVHX1dXX01VVEVYX1NMT1dQQVRIPXkKQ09O
RklHX0RFQlVHX0xPQ0tfQUxMT0M9eQpDT05GSUdfTE9DS0RFUD15CiMgQ09ORklHX0RFQlVHX0xP
Q0tERVAgaXMgbm90IHNldApDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQPXkKIyBDT05GSUdfREVC
VUdfTE9DS0lOR19BUElfU0VMRlRFU1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9DS19UT1JUVVJF
X1RFU1QgaXMgbm90IHNldAojIENPTkZJR19XV19NVVRFWF9TRUxGVEVTVCBpcyBub3Qgc2V0CkNP
TkZJR19UUkFDRV9JUlFGTEFHUz15CkNPTkZJR19TVEFDS1RSQUNFPXkKQ09ORklHX1dBUk5fQUxM
X1VOU0VFREVEX1JBTkRPTT15CiMgQ09ORklHX0RFQlVHX0tPQkpFQ1QgaXMgbm90IHNldApDT05G
SUdfREVCVUdfQlVHVkVSQk9TRT15CkNPTkZJR19ERUJVR19MSVNUPXkKIyBDT05GSUdfREVCVUdf
UElfTElTVCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19TRz15CiMgQ09ORklHX0RFQlVHX05PVElG
SUVSUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0NSRURFTlRJQUxTIGlzIG5vdCBzZXQKCiMK
IyBSQ1UgRGVidWdnaW5nCiMKQ09ORklHX1BST1ZFX1JDVT15CkNPTkZJR19UT1JUVVJFX1RFU1Q9
eQpDT05GSUdfUkNVX1BFUkZfVEVTVD15CkNPTkZJR19SQ1VfVE9SVFVSRV9URVNUPW0KIyBDT05G
SUdfUkNVX1RSQUNFIGlzIG5vdCBzZXQKQ09ORklHX1JDVV9FUVNfREVCVUc9eQpDT05GSUdfREVC
VUdfV1FfRk9SQ0VfUlJfQ1BVPXkKIyBDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUSU9OIGlz
IG5vdCBzZXQKQ09ORklHX0ZBVUxUX0lOSkVDVElPTj15CkNPTkZJR19GQUlMX1BBR0VfQUxMT0M9
eQojIENPTkZJR19GQUlMX0ZVVEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfRkFVTFRfSU5KRUNUSU9O
X0RFQlVHX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTEFURU5DWVRPUCBpcyBub3Qgc2V0CkNPTkZJ
R19VU0VSX1NUQUNLVFJBQ0VfU1VQUE9SVD15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX1RSQUNFUj15
CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUj15CkNPTkZJR19IQVZFX0RZTkFNSUNf
RlRSQUNFPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTPXkKQ09ORklHX0hB
VkVfRlRSQUNFX01DT1VOVF9SRUNPUkQ9eQpDT05GSUdfSEFWRV9TWVNDQUxMX1RSQUNFUE9JTlRT
PXkKQ09ORklHX0hBVkVfRkVOVFJZPXkKQ09ORklHX0hBVkVfQ19SRUNPUkRNQ09VTlQ9eQpDT05G
SUdfVFJBQ0lOR19TVVBQT1JUPXkKIyBDT05GSUdfRlRSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdf
UFJPVklERV9PSENJMTM5NF9ETUFfSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQV9BUElfREVC
VUcgaXMgbm90IHNldApDT05GSUdfUlVOVElNRV9URVNUSU5HX01FTlU9eQpDT05GSUdfVEVTVF9M
SVNUX1NPUlQ9bQpDT05GSUdfVEVTVF9TT1JUPXkKIyBDT05GSUdfQkFDS1RSQUNFX1NFTEZfVEVT
VCBpcyBub3Qgc2V0CkNPTkZJR19SQlRSRUVfVEVTVD1tCkNPTkZJR19JTlRFUlZBTF9UUkVFX1RF
U1Q9eQpDT05GSUdfUEVSQ1BVX1RFU1Q9bQojIENPTkZJR19BVE9NSUM2NF9TRUxGVEVTVCBpcyBu
b3Qgc2V0CkNPTkZJR19URVNUX0hFWERVTVA9eQpDT05GSUdfVEVTVF9TVFJJTkdfSEVMUEVSUz1t
CkNPTkZJR19URVNUX0tTVFJUT1g9bQpDT05GSUdfVEVTVF9QUklOVEY9bQpDT05GSUdfVEVTVF9C
SVRNQVA9bQojIENPTkZJR19URVNUX1VVSUQgaXMgbm90IHNldApDT05GSUdfVEVTVF9SSEFTSFRB
QkxFPW0KIyBDT05GSUdfVEVTVF9IQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9MS00gaXMg
bm90IHNldApDT05GSUdfVEVTVF9VU0VSX0NPUFk9bQojIENPTkZJR19URVNUX0JQRiBpcyBub3Qg
c2V0CkNPTkZJR19GSU5EX0JJVF9CRU5DSE1BUks9eQpDT05GSUdfVEVTVF9GSVJNV0FSRT15CiMg
Q09ORklHX1RFU1RfU1lTQ1RMIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9VREVMQVkgaXMgbm90
IHNldAojIENPTkZJR19URVNUX1NUQVRJQ19LRVlTIGlzIG5vdCBzZXQKQ09ORklHX01FTVRFU1Q9
eQojIENPTkZJR19CVUdfT05fREFUQV9DT1JSVVBUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FN
UExFUyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0dEQj15CiMgQ09ORklHX0tHREIgaXMg
bm90IHNldApDT05GSUdfQVJDSF9IQVNfVUJTQU5fU0FOSVRJWkVfQUxMPXkKIyBDT05GSUdfVUJT
QU4gaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfREVWTUVNX0lTX0FMTE9XRUQ9eQpDT05GSUdf
WDg2X1ZFUkJPU0VfQk9PVFVQPXkKIyBDT05GSUdfRUFSTFlfUFJJTlRLIGlzIG5vdCBzZXQKQ09O
RklHX1g4Nl9QVERVTVBfQ09SRT15CkNPTkZJR19YODZfUFREVU1QPW0KIyBDT05GSUdfREVCVUdf
V1ggaXMgbm90IHNldAojIENPTkZJR19ET1VCTEVGQVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX1RMQkZMVVNIIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfTU1JT1RSQUNFX1NVUFBPUlQ9eQpD
T05GSUdfSU9fREVMQVlfVFlQRV8wWDgwPTAKQ09ORklHX0lPX0RFTEFZX1RZUEVfMFhFRD0xCkNP
TkZJR19JT19ERUxBWV9UWVBFX1VERUxBWT0yCkNPTkZJR19JT19ERUxBWV9UWVBFX05PTkU9Mwoj
IENPTkZJR19JT19ERUxBWV8wWDgwIGlzIG5vdCBzZXQKQ09ORklHX0lPX0RFTEFZXzBYRUQ9eQoj
IENPTkZJR19JT19ERUxBWV9VREVMQVkgaXMgbm90IHNldAojIENPTkZJR19JT19ERUxBWV9OT05F
IGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfSU9fREVMQVlfVFlQRT0xCiMgQ09ORklHX0RFQlVH
X0JPT1RfUEFSQU1TIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BBX0RFQlVHIGlzIG5vdCBzZXQKIyBD
T05GSUdfT1BUSU1JWkVfSU5MSU5JTkcgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19FTlRSWSBp
cyBub3Qgc2V0CkNPTkZJR19ERUJVR19OTUlfU0VMRlRFU1Q9eQpDT05GSUdfWDg2X0RFQlVHX0ZQ
VT15CiMgQ09ORklHX1BVTklUX0FUT01fREVCVUcgaXMgbm90IHNldAojIENPTkZJR19VTldJTkRF
Ul9PUkMgaXMgbm90IHNldApDT05GSUdfVU5XSU5ERVJfRlJBTUVfUE9JTlRFUj15CiMgQ09ORklH
X1VOV0lOREVSX0dVRVNTIGlzIG5vdCBzZXQKCiMKIyBTZWN1cml0eSBvcHRpb25zCiMKQ09ORklH
X0tFWVM9eQojIENPTkZJR19QRVJTSVNURU5UX0tFWVJJTkdTIGlzIG5vdCBzZXQKIyBDT05GSUdf
QklHX0tFWVMgaXMgbm90IHNldApDT05GSUdfVFJVU1RFRF9LRVlTPW0KIyBDT05GSUdfRU5DUllQ
VEVEX0tFWVMgaXMgbm90IHNldAojIENPTkZJR19LRVlfREhfT1BFUkFUSU9OUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFQ1VSSVRZX0RNRVNHX1JFU1RSSUNUIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VS
SVRZPXkKQ09ORklHX1NFQ1VSSVRZRlM9eQpDT05GSUdfU0VDVVJJVFlfTkVUV09SSz15CkNPTkZJ
R19QQUdFX1RBQkxFX0lTT0xBVElPTj15CiMgQ09ORklHX1NFQ1VSSVRZX05FVFdPUktfWEZSTSBp
cyBub3Qgc2V0CkNPTkZJR19TRUNVUklUWV9QQVRIPXkKIyBDT05GSUdfRk9SVElGWV9TT1VSQ0Ug
aXMgbm90IHNldApDT05GSUdfU1RBVElDX1VTRVJNT0RFSEVMUEVSPXkKQ09ORklHX1NUQVRJQ19V
U0VSTU9ERUhFTFBFUl9QQVRIPSIvc2Jpbi91c2VybW9kZS1oZWxwZXIiCiMgQ09ORklHX1NFQ1VS
SVRZX1NNQUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfVE9NT1lPIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VDVVJJVFlfQVBQQVJNT1IgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9Z
QU1BIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUdSSVRZIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFV
TFRfU0VDVVJJVFlfREFDPXkKQ09ORklHX0RFRkFVTFRfU0VDVVJJVFk9IiIKQ09ORklHX0NSWVBU
Tz15CgojCiMgQ3J5cHRvIGNvcmUgb3IgaGVscGVyCiMKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpD
T05GSUdfQ1JZUFRPX0FMR0FQSTI9eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRP
X0FFQUQyPXkKQ09ORklHX0NSWVBUT19CTEtDSVBIRVI9eQpDT05GSUdfQ1JZUFRPX0JMS0NJUEhF
UjI9eQpDT05GSUdfQ1JZUFRPX0hBU0g9eQpDT05GSUdfQ1JZUFRPX0hBU0gyPXkKQ09ORklHX0NS
WVBUT19STkc9eQpDT05GSUdfQ1JZUFRPX1JORzI9eQpDT05GSUdfQ1JZUFRPX1JOR19ERUZBVUxU
PXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUjI9eQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSPXkKQ09O
RklHX0NSWVBUT19LUFAyPXkKQ09ORklHX0NSWVBUT19LUFA9eQpDT05GSUdfQ1JZUFRPX0FDT01Q
Mj15CkNPTkZJR19DUllQVE9fUlNBPXkKQ09ORklHX0NSWVBUT19ESD15CkNPTkZJR19DUllQVE9f
RUNESD15CkNPTkZJR19DUllQVE9fTUFOQUdFUj15CkNPTkZJR19DUllQVE9fTUFOQUdFUjI9eQpD
T05GSUdfQ1JZUFRPX1VTRVI9bQpDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElTQUJMRV9URVNUUz15
CkNPTkZJR19DUllQVE9fR0YxMjhNVUw9bQpDT05GSUdfQ1JZUFRPX05VTEw9eQpDT05GSUdfQ1JZ
UFRPX05VTEwyPXkKQ09ORklHX0NSWVBUT19XT1JLUVVFVUU9eQpDT05GSUdfQ1JZUFRPX0NSWVBU
RD15CkNPTkZJR19DUllQVE9fTUNSWVBURD1tCkNPTkZJR19DUllQVE9fQVVUSEVOQz1tCkNPTkZJ
R19DUllQVE9fVEVTVD1tCkNPTkZJR19DUllQVE9fU0lNRD15CkNPTkZJR19DUllQVE9fR0xVRV9I
RUxQRVJfWDg2PXkKCiMKIyBBdXRoZW50aWNhdGVkIEVuY3J5cHRpb24gd2l0aCBBc3NvY2lhdGVk
IERhdGEKIwpDT05GSUdfQ1JZUFRPX0NDTT15CkNPTkZJR19DUllQVE9fR0NNPW0KQ09ORklHX0NS
WVBUT19DSEFDSEEyMFBPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19TRVFJVj15CkNPTkZJR19DUllQ
VE9fRUNIQUlOSVY9eQoKIwojIEJsb2NrIG1vZGVzCiMKQ09ORklHX0NSWVBUT19DQkM9eQojIENP
TkZJR19DUllQVE9fQ0ZCIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DVFI9eQpDT05GSUdfQ1JZ
UFRPX0NUUz15CkNPTkZJR19DUllQVE9fRUNCPXkKIyBDT05GSUdfQ1JZUFRPX0xSVyBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fUENCQz15CkNPTkZJR19DUllQVE9fWFRTPXkKQ09ORklHX0NSWVBU
T19LRVlXUkFQPW0KCiMKIyBIYXNoIG1vZGVzCiMKQ09ORklHX0NSWVBUT19DTUFDPW0KQ09ORklH
X0NSWVBUT19ITUFDPXkKQ09ORklHX0NSWVBUT19YQ0JDPXkKQ09ORklHX0NSWVBUT19WTUFDPW0K
CiMKIyBEaWdlc3QKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CiMgQ09ORklHX0NSWVBUT19DUkMz
MkNfSU5URUwgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ1JDMzIgaXMgbm90IHNldApDT05G
SUdfQ1JZUFRPX0NSQzMyX1BDTE1VTD15CkNPTkZJR19DUllQVE9fQ1JDVDEwRElGPW0KIyBDT05G
SUdfQ1JZUFRPX0NSQ1QxMERJRl9QQ0xNVUwgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0dIQVNI
PW0KQ09ORklHX0NSWVBUT19QT0xZMTMwNT15CiMgQ09ORklHX0NSWVBUT19QT0xZMTMwNV9YODZf
NjQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX01END15CkNPTkZJR19DUllQVE9fTUQ1PXkKIyBD
T05GSUdfQ1JZUFRPX01JQ0hBRUxfTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1JNRDEy
OCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fUk1EMTYwPXkKQ09ORklHX0NSWVBUT19STUQyNTY9
eQojIENPTkZJR19DUllQVE9fUk1EMzIwIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TSEExPW0K
Q09ORklHX0NSWVBUT19TSEExX1NTU0UzPW0KQ09ORklHX0NSWVBUT19TSEEyNTZfU1NTRTM9eQoj
IENPTkZJR19DUllQVE9fU0hBNTEyX1NTU0UzIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TSEEx
X01CPW0KQ09ORklHX0NSWVBUT19TSEEyNTZfTUI9bQojIENPTkZJR19DUllQVE9fU0hBNTEyX01C
IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TSEEyNTY9eQpDT05GSUdfQ1JZUFRPX1NIQTUxMj1t
CkNPTkZJR19DUllQVE9fU0hBMz15CkNPTkZJR19DUllQVE9fU00zPXkKQ09ORklHX0NSWVBUT19U
R1IxOTI9bQpDT05GSUdfQ1JZUFRPX1dQNTEyPXkKQ09ORklHX0NSWVBUT19HSEFTSF9DTE1VTF9O
SV9JTlRFTD15CgojCiMgQ2lwaGVycwojCkNPTkZJR19DUllQVE9fQUVTPXkKIyBDT05GSUdfQ1JZ
UFRPX0FFU19USSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQUVTX1g4Nl82ND1tCiMgQ09ORklH
X0NSWVBUT19BRVNfTklfSU5URUwgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQU5VQklTIGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19BUkM0PW0KIyBDT05GSUdfQ1JZUFRPX0JMT1dGSVNIIGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19CTE9XRklTSF9DT01NT049eQpDT05GSUdfQ1JZUFRPX0JM
T1dGSVNIX1g4Nl82ND15CkNPTkZJR19DUllQVE9fQ0FNRUxMSUE9eQpDT05GSUdfQ1JZUFRPX0NB
TUVMTElBX1g4Nl82ND15CkNPTkZJR19DUllQVE9fQ0FNRUxMSUFfQUVTTklfQVZYX1g4Nl82ND15
CkNPTkZJR19DUllQVE9fQ0FNRUxMSUFfQUVTTklfQVZYMl9YODZfNjQ9eQpDT05GSUdfQ1JZUFRP
X0NBU1RfQ09NTU9OPXkKQ09ORklHX0NSWVBUT19DQVNUNT15CkNPTkZJR19DUllQVE9fQ0FTVDVf
QVZYX1g4Nl82ND15CkNPTkZJR19DUllQVE9fQ0FTVDY9eQpDT05GSUdfQ1JZUFRPX0NBU1Q2X0FW
WF9YODZfNjQ9eQpDT05GSUdfQ1JZUFRPX0RFUz15CkNPTkZJR19DUllQVE9fREVTM19FREVfWDg2
XzY0PXkKIyBDT05GSUdfQ1JZUFRPX0ZDUllQVCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fS0hB
WkFEPXkKQ09ORklHX0NSWVBUT19TQUxTQTIwPXkKQ09ORklHX0NSWVBUT19TQUxTQTIwX1g4Nl82
ND15CkNPTkZJR19DUllQVE9fQ0hBQ0hBMjA9eQpDT05GSUdfQ1JZUFRPX0NIQUNIQTIwX1g4Nl82
ND1tCkNPTkZJR19DUllQVE9fU0VFRD15CkNPTkZJR19DUllQVE9fU0VSUEVOVD15CiMgQ09ORklH
X0NSWVBUT19TRVJQRU5UX1NTRTJfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NF
UlBFTlRfQVZYX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UX0FWWDJf
WDg2XzY0IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TTTQ9eQpDT05GSUdfQ1JZUFRPX1NQRUNL
PW0KIyBDT05GSUdfQ1JZUFRPX1RFQSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fVFdPRklTSD1t
CkNPTkZJR19DUllQVE9fVFdPRklTSF9DT01NT049eQpDT05GSUdfQ1JZUFRPX1RXT0ZJU0hfWDg2
XzY0PXkKQ09ORklHX0NSWVBUT19UV09GSVNIX1g4Nl82NF8zV0FZPXkKQ09ORklHX0NSWVBUT19U
V09GSVNIX0FWWF9YODZfNjQ9bQoKIwojIENvbXByZXNzaW9uCiMKQ09ORklHX0NSWVBUT19ERUZM
QVRFPW0KQ09ORklHX0NSWVBUT19MWk89eQpDT05GSUdfQ1JZUFRPXzg0Mj15CkNPTkZJR19DUllQ
VE9fTFo0PW0KQ09ORklHX0NSWVBUT19MWjRIQz15CgojCiMgUmFuZG9tIE51bWJlciBHZW5lcmF0
aW9uCiMKQ09ORklHX0NSWVBUT19BTlNJX0NQUk5HPXkKQ09ORklHX0NSWVBUT19EUkJHX01FTlU9
eQpDT05GSUdfQ1JZUFRPX0RSQkdfSE1BQz15CiMgQ09ORklHX0NSWVBUT19EUkJHX0hBU0ggaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fRFJCR19DVFIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRP
X0RSQkc9eQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFk9eQpDT05GSUdfQ1JZUFRPX1VTRVJf
QVBJPXkKIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0hBU0ggaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX1VTRVJfQVBJX1NLQ0lQSEVSPW0KQ09ORklHX0NSWVBUT19VU0VSX0FQSV9STkc9eQpDT05G
SUdfQ1JZUFRPX1VTRVJfQVBJX0FFQUQ9bQpDT05GSUdfQ1JZUFRPX0hBU0hfSU5GTz15CiMgQ09O
RklHX0NSWVBUT19IVyBpcyBub3Qgc2V0CkNPTkZJR19BU1lNTUVUUklDX0tFWV9UWVBFPXkKQ09O
RklHX0FTWU1NRVRSSUNfUFVCTElDX0tFWV9TVUJUWVBFPXkKQ09ORklHX1g1MDlfQ0VSVElGSUNB
VEVfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzdfTUVTU0FHRV9QQVJTRVIgaXMgbm90IHNldAoKIwoj
IENlcnRpZmljYXRlcyBmb3Igc2lnbmF0dXJlIGNoZWNraW5nCiMKIyBDT05GSUdfU1lTVEVNX1RS
VVNURURfS0VZUklORyBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1RFTV9CTEFDS0xJU1RfS0VZUklO
RyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0tWTT15CiMgQ09ORklHX1ZJUlRVQUxJWkFUSU9OIGlz
IG5vdCBzZXQKCiMKIyBMaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX0JJVFJFVkVSU0U9eQpDT05G
SUdfUkFUSU9OQUw9eQpDT05GSUdfR0VORVJJQ19TVFJOQ1BZX0ZST01fVVNFUj15CkNPTkZJR19H
RU5FUklDX1NUUk5MRU5fVVNFUj15CkNPTkZJR19HRU5FUklDX05FVF9VVElMUz15CkNPTkZJR19H
RU5FUklDX0ZJTkRfRklSU1RfQklUPXkKQ09ORklHX0dFTkVSSUNfUENJX0lPTUFQPXkKQ09ORklH
X0dFTkVSSUNfSU9NQVA9eQpDT05GSUdfQVJDSF9VU0VfQ01QWENIR19MT0NLUkVGPXkKQ09ORklH
X0FSQ0hfSEFTX0ZBU1RfTVVMVElQTElFUj15CkNPTkZJR19DUkNfQ0NJVFQ9eQpDT05GSUdfQ1JD
MTY9bQpDT05GSUdfQ1JDX1QxMERJRj1tCkNPTkZJR19DUkNfSVRVX1Q9eQpDT05GSUdfQ1JDMzI9
eQojIENPTkZJR19DUkMzMl9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NMSUNF
Qlk4IGlzIG5vdCBzZXQKQ09ORklHX0NSQzMyX1NMSUNFQlk0PXkKIyBDT05GSUdfQ1JDMzJfU0FS
V0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX0JJVCBpcyBub3Qgc2V0CkNPTkZJR19DUkM0
PW0KIyBDT05GSUdfQ1JDNyBpcyBub3Qgc2V0CkNPTkZJR19MSUJDUkMzMkM9bQpDT05GSUdfQ1JD
OD15CkNPTkZJR19SQU5ET00zMl9TRUxGVEVTVD15CkNPTkZJR184NDJfQ09NUFJFU1M9eQpDT05G
SUdfODQyX0RFQ09NUFJFU1M9eQpDT05GSUdfWkxJQl9JTkZMQVRFPXkKQ09ORklHX1pMSUJfREVG
TEFURT15CkNPTkZJR19MWk9fQ09NUFJFU1M9eQpDT05GSUdfTFpPX0RFQ09NUFJFU1M9eQpDT05G
SUdfTFo0X0NPTVBSRVNTPW0KQ09ORklHX0xaNEhDX0NPTVBSRVNTPXkKQ09ORklHX0xaNF9ERUNP
TVBSRVNTPXkKQ09ORklHX1haX0RFQz15CkNPTkZJR19YWl9ERUNfWDg2PXkKQ09ORklHX1haX0RF
Q19QT1dFUlBDPXkKIyBDT05GSUdfWFpfREVDX0lBNjQgaXMgbm90IHNldAojIENPTkZJR19YWl9E
RUNfQVJNIGlzIG5vdCBzZXQKIyBDT05GSUdfWFpfREVDX0FSTVRIVU1CIGlzIG5vdCBzZXQKQ09O
RklHX1haX0RFQ19TUEFSQz15CkNPTkZJR19YWl9ERUNfQkNKPXkKQ09ORklHX1haX0RFQ19URVNU
PW0KQ09ORklHX0RFQ09NUFJFU1NfR1pJUD15CkNPTkZJR19ERUNPTVBSRVNTX1haPXkKQ09ORklH
X0RFQ09NUFJFU1NfTFpPPXkKQ09ORklHX0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX1JFRURf
U09MT01PTj15CkNPTkZJR19SRUVEX1NPTE9NT05fRU5DOD15CkNPTkZJR19SRUVEX1NPTE9NT05f
REVDOD15CkNPTkZJR19CQ0g9bQpDT05GSUdfQkNIX0NPTlNUX1BBUkFNUz15CkNPTkZJR19JTlRF
UlZBTF9UUkVFPXkKQ09ORklHX1JBRElYX1RSRUVfTVVMVElPUkRFUj15CkNPTkZJR19BU1NPQ0lB
VElWRV9BUlJBWT15CkNPTkZJR19IQVNfSU9NRU09eQpDT05GSUdfSEFTX0lPUE9SVF9NQVA9eQpD
T05GSUdfSEFTX0RNQT15CkNPTkZJR19TR0xfQUxMT0M9eQpDT05GSUdfRE1BX0RJUkVDVF9PUFM9
eQpDT05GSUdfRFFMPXkKQ09ORklHX05MQVRUUj15CkNPTkZJR19DTFpfVEFCPXkKQ09ORklHX0NP
UkRJQz1tCkNPTkZJR19ERFI9eQojIENPTkZJR19JUlFfUE9MTCBpcyBub3Qgc2V0CkNPTkZJR19N
UElMSUI9eQpDT05GSUdfT0lEX1JFR0lTVFJZPXkKQ09ORklHX0FSQ0hfSEFTX1NHX0NIQUlOPXkK
Q09ORklHX0FSQ0hfSEFTX1BNRU1fQVBJPXkKQ09ORklHX0FSQ0hfSEFTX1VBQ0NFU1NfRkxVU0hD
QUNIRT15CiMgQ09ORklHX1NUUklOR19TRUxGVEVTVCBpcyBub3Qgc2V0Cg==

--===============3659209874511249718==--

