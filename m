Content-Type: multipart/mixed; boundary="===============4191037080864542780=="
MIME-Version: 1.0
From: Andreas Gruenbacher <agruenba@redhat.com>
To: lkp@lists.01.org
Subject: Re: [nfs] 25847d9a3a: system hang
Date: Tue, 31 May 2016 14:57:42 +0200
Message-ID: <CAHc6FU435dxij_v4bBoeNJ_AcerOLES4AD2dNZ-WeUOSDj71ww@mail.gmail.com>
In-Reply-To: <20160512042628.GA24406@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4191037080864542780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 12, 2016 at 6:26 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/agruen/linux-richacl.git =
richacl-wip
> commit 25847d9a3ad59f72b8f37dd73f34ef45b5a30115 ("nfs: Add richacl suppor=
t")
>
> on test machine: lkp-hsw01: 56 threads Grantley Haswell-EP with 64G memory
>
> caused system hang during vm-scalability test (our system heavily relies =
on NFS
> to lanuch testcase and store test data).

thanks a lot for testing.

The snapshot I've posted today should have this bug fixed.

Thanks,
Andreas

--===============4191037080864542780==--

