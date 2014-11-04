Content-Type: multipart/mixed; boundary="===============7294808448282477802=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [AHCI] XFS (sda3): metadata I/O error: block 0x941ce20 ("xlog_iodone") error 5 numblks 64
Date: Tue, 04 Nov 2014 08:38:20 -0500
Message-ID: <20141104133820.GA13567@htj.dyndns.org>
In-Reply-To: <20141104042522.GA14917@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7294808448282477802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2014 at 12:25:22PM +0800, Fengguang Wu wrote:
> Hi Tejun,
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata for-3.18-fixes
> commit 61e268068c92ed000f078dc1ab71d1228439fecd ("Revert "AHCI: Optimize =
single IRQ interrupt processing"")

Yeah, there's a dependent revert that I missed.  libata/for-3.18-fixes
has been rebased, so this shouldn't happen anymore.

Thanks.

-- =

tejun

--===============7294808448282477802==--

