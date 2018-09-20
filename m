Content-Type: multipart/mixed; boundary="===============8854837678383136527=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/pci] 7ffb31888c: PANIC:early_exception
Date: Thu, 20 Sep 2018 11:39:17 +0200
Message-ID: <alpine.DEB.2.21.1809201138230.3243@nanos.tec.linutronix.de>
In-Reply-To: <7e9e862a-e890-775f-ed92-74c591c7deb6@hygon.cn>
List-Id: <oe-lkp.lists.linux.dev>

--===============8854837678383136527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Sep 2018, Pu Wen wrote:
> On 2018/9/20 8:26, Rong Chen wrote:
> > On 09/19/2018 09:53 PM, Pu Wen wrote:
> > > I cannot reproduce this panic on Hygon Dhyana platform. I tired lkp-t=
ests
> > > both in Ubuntu 16.04 (with gcc-5) and Ubuntu 18.04 (with gcc-7).
> > > What kind of host do you use to run the qemu? A Intel one or AMD one?
> > It's a Intel one,
> > =

> > model: Nehalem-EX
> > memory: 224G
> > nr_node: 4
> > nr_cpu: 64
> > nr_socket: 4
> > brand: Intel(R) Xeon(R) CPU X7560 @ 2.27GHz
> =

> I reproduced the PANIC by running lkp-tests with a Intel machine.
> =

> The reason is that the function early_is_amd_nb is called even if
> running on Intel machine. At this case the misc_ids is NULL so the
> PANIC occur.
> =

> I'll rework a patch to solve this problem, either restore the default
> value of misc_ids with the original AMD one or not call early_is_amd_nb
> on Intel platform.

Return when !AMD and !HYGON is the right thing to do. No point in checking
device ids which cannot happen in the first place.

Thanks,

	tglx

--===============8854837678383136527==--

