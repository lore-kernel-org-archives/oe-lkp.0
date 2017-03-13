Content-Type: multipart/mixed; boundary="===============6248394615205013667=="
MIME-Version: 1.0
From: Linus Lüssing <linus.luessing@c0d3.blue>
To: lkp@lists.01.org
Subject: Re: [ipv6] a088d1d73a: WARNING:at_net/mac80211/agg-tx.c:#ieee80211_start_tx_ba_cb[mac80211]
Date: Mon, 13 Mar 2017 15:18:35 +0100
Message-ID: <20170313141835.GL15692@otheros>
In-Reply-To: <20170222020301.GA1067@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6248394615205013667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 10:03:02AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: a088d1d73a4bcfd7bc482f8d08375b9b665dc3e5 ("ipv6: Fix IPv6 packet =
loss in scenarios involving roaming + snooping switches")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: hwsim
> with following parameters:
> =

> 	group: hwsim-01
[...]
> kern  :warn  : [  146.568070] WARNING: CPU: 12 PID: 669 at net/mac80211/a=
gg-tx.c:770 ieee80211_start_tx_ba_cb+0x139/0x150 [mac80211]
[...]
> kern  :warn  : [  146.568114] CPU: 12 PID: 669 Comm: kworker/u256:1 Not t=
ainted 4.10.0-rc6-00104-ga088d1d #1
> kern  :warn  : [  146.568115] Hardware name: Intel Corporation LH Pass/S4=
600LH...., BIOS SE5C600.86B.99.02.1047.032320122259 03/23/2012
> kern  :warn  : [  146.568127] Workqueue: phy0 ieee80211_iface_work [mac80=
211]
> kern  :warn  : [  146.568128] Call Trace:
> kern  :warn  : [  146.568141]  dump_stack+0x63/0x8a
> kern  :warn  : [  146.568146]  __warn+0xcb/0xf0
> kern  :warn  : [  146.568147]  warn_slowpath_null+0x1d/0x20
> kern  :warn  : [  146.568156]  ieee80211_start_tx_ba_cb+0x139/0x150 [mac8=
0211]
> kern  :warn  : [  146.568166]  ieee80211_iface_work+0x266/0x470 [mac80211]
> kern  :warn  : [  146.568180]  process_one_work+0x1a3/0x480
> kern  :warn  : [  146.568182]  worker_thread+0x4e/0x4d0
> kern  :warn  : [  146.568185]  kthread+0x10c/0x140
> kern  :warn  : [  146.568187]  ? process_one_work+0x480/0x480
> kern  :warn  : [  146.568187]  ? kthread_create_on_node+0x40/0x40
> kern  :warn  : [  146.568195]  ret_from_fork+0x2c/0x40
> kern  :warn  : [  146.568197] ---[ end trace 0e4afc24db5dbafa ]---

Unfortunately, I wasn't able to reproduce this issue with the
plain mac80211-hwsim test suite yet. The according test runs successfully
in my VMs here...

To me, it looks like the WARN_ON() could be triggered by a race condition
in mac80211 or mac80211-hwsim, too. I'm going to forward this to and
discuss this further on the wireless mailing list.

Thanks for the notification, Xiaolong!

Regards, Linus

--===============6248394615205013667==--

