Content-Type: multipart/mixed; boundary="===============2892999269104830451=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] 91727d2eac: WARNING: CPU: 0 PID: 65 at mm/memcontrol.c:998 mem_cgroup_update_lru_size+0xf0/0x106
Date: Wed, 21 Sep 2016 16:42:12 +0200
Message-ID: <20160921144212.GX4716@redhat.com>
In-Reply-To: <20160921020912.GA22398@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2892999269104830451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 10:09:12AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git master
> commit 91727d2eac2b5800bda8d12c3007548c9e1196c8 ("Revert "mm, page_alloc:=
 remove fair zone allocation policy"")
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s

Unless this happens also before or after all the reverts, I don't
think it's a concern. These reverts are in reverse-upstream order, so
it's probably a bisection problem that is inherited from how they were
applied upstream?

Maybe you could skip testing reverts of upstream patches to save
resources? And only test the commits before/after reverts of upstream
patches? (or the last one even if it's a revert)

--===============2892999269104830451==--

