Content-Type: multipart/mixed; boundary="===============4299814631908792089=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [workqueue] 82607adcf9: BUG: workqueue lockup - pool cpus=0 flags=0x4 nice=0 stuck for 42s!
Date: Mon, 15 Feb 2016 13:59:12 -0500
Message-ID: <20160215185912.GJ3965@htj.duckdns.org>
In-Reply-To: <87y4ao6qx3.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4299814631908792089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Feb 14, 2016 at 09:07:04AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 82607adcf9cdf40fb7b5331269780c8f70ec6e35 ("workqueue: implement lo=
ckup detector")
> =

> =

> [   75.684302] virtio-pci 0000:00:06.0: virtio_pci: leaving for legacy dr=
iver
> [   88.791869] ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
> [   88.795120] virtio-pci 0000:00:07.0: virtio_pci: leaving for legacy dr=
iver
> [   90.789792] BUG: workqueue lockup - pool cpus=3D0 flags=3D0x4 nice=3D0=
 stuck for 42s!
> [   90.794158] Showing busy workqueues and worker pools:
> [   90.796507] workqueue cgroup_pidlist_destroy: flags=3D0x0
> [   90.798976]   pwq 0: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1=
/1

Was the VM not executing for a long time?  I can't think why
cgroup_pidlist_destroy would hang for over 40s.

Thanks.

-- =

tejun

--===============4299814631908792089==--

