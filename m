Content-Type: multipart/mixed; boundary="===============2903166254130551828=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched/deadline] kernel BUG at kernel/sched/deadline.c:805!
Date: Wed, 18 Feb 2015 19:00:21 +0100
Message-ID: <20150218180021.GA32019@gmail.com>
In-Reply-To: <20150216133735.GA4158@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2903166254130551828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Fengguang Wu <fengguang.wu@intel.com> wrote:

> On Mon, Feb 16, 2015 at 09:25:57PM +0800, Fengguang Wu wrote:
> > On Mon, Feb 16, 2015 at 01:49:50PM +0100, Peter Zijlstra wrote:
> > > On Mon, Feb 16, 2015 at 03:20:38PM +0800, Fengguang Wu wrote:
> > > > Elapsed time: 25
> > > > qemu-system-x86_64 -cpu kvm64 -enable-kvm -kernel /kernel/i386-rand=
config-x1-02152111/1019a359d3dc4b64d0e1e5a5efcb725d5e83994d/vmlinuz-3.19.0-=
rc6-00041-g1019a35 =

> > > =

> > > But you 'forgot' to include the .config for this particular randconfi=
g ^
> > > =

> > > Now I could probably figure it out from the reported crash and dmesg,
> > > but please, just always include the used .config.
> > =

> > Sorry it looks the script does not reliably include the config.
> =

> It's the mailing system going wrong somewhere between the =

> robot and me. The original email copy was good, however =

> attachments get truncated/lost when reach me.

it might make sense to just append them in the body, =

instead of an attachment?

Thanks,

	Ingo

--===============2903166254130551828==--

