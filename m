Content-Type: multipart/mixed; boundary="===============8847540139462857984=="
MIME-Version: 1.0
From: Ilya Dryomov <idryomov@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rbd] 2f18d46683: vm-scalability.throughput -92.3% regression
Date: Fri, 22 Jun 2018 11:00:08 +0200
Message-ID: <CAOi1vP8q45y35hbFyqkNGN4iB2BAbBwzhwROO6TmaoURJUcFEg@mail.gmail.com>
In-Reply-To: <20180622083408.GZ11011@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8847540139462857984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 10:37 AM kernel test robot
<xiaolong.ye@intel.com> wrote:
>
>
> Greeting,
>
> We noticed a -92.3% regression of vm-scalability.throughput due to commit:
>
> commit: 2f18d46683cb3047c41229d57cf7c6e2ee48676f ("rbd: refactor rbd_wait=
_state_locked()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: vm-scalability
> on test machine: 80 threads Skylake with 64G memory
> with following parameters:
>
>         runtime: 300s
>         test: lru-file-readonce
>         cpufreq_governor: performance
>
> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/

This is a false positive: rbd is disabled in the attached config,
as is the rest of ceph:

  # CONFIG_CEPH_LIB is not set
  # CONFIG_BLK_DEV_RBD is not set
  # CONFIG_CEPH_FS is not set

Thanks,

                Ilya

--===============8847540139462857984==--

