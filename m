Content-Type: multipart/mixed; boundary="===============7408639422375081836=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/deadline] kernel BUG at kernel/sched/deadline.c:805!
Date: Mon, 16 Feb 2015 21:37:35 +0800
Message-ID: <20150216133735.GA4158@wfg-t540p.sh.intel.com>
In-Reply-To: <20150216132557.GA3720@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7408639422375081836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 09:25:57PM +0800, Fengguang Wu wrote:
> On Mon, Feb 16, 2015 at 01:49:50PM +0100, Peter Zijlstra wrote:
> > On Mon, Feb 16, 2015 at 03:20:38PM +0800, Fengguang Wu wrote:
> > > Elapsed time: 25
> > > qemu-system-x86_64 -cpu kvm64 -enable-kvm -kernel /kernel/i386-randco=
nfig-x1-02152111/1019a359d3dc4b64d0e1e5a5efcb725d5e83994d/vmlinuz-3.19.0-rc=
6-00041-g1019a35 =

> > =

> > But you 'forgot' to include the .config for this particular randconfig ^
> > =

> > Now I could probably figure it out from the reported crash and dmesg,
> > but please, just always include the used .config.
> =

> Sorry it looks the script does not reliably include the config.

It's the mailing system going wrong somewhere between the robot and me.
The original email copy was good, however attachments get truncated/lost =

when reach me.

Thanks,
Fengguang

--===============7408639422375081836==--

