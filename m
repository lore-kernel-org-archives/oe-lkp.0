Content-Type: multipart/mixed; boundary="===============4092689797730555971=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 67ffc906f8:WARNING:at_mm/filemap.c:#__warn_lock_page_from_reclaim_context
Date: Thu, 29 Mar 2018 19:32:11 +0900
Message-ID: <201803291932.AJH35913.JOQSFFtOLFOVHM@I-love.SAKURA.ne.jp>
In-Reply-To: <20180329070409.GF4172@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4092689797730555971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-4.9):
> =

> commit: 67ffc906f8dee0e0433cad83dbdd198e5d1fc86f ("mm: Warn on lock_page(=
) from reclaim context.")
> url: https://github.com/0day-ci/linux/commits/Tetsuo-Handa/mm-Warn-on-loc=
k_page-from-reclaim-context/20180318-173622

Thanks. Already fixed in v4.16-rc7.

commit b3cd54b257ad95d344d121dc563d943ca39b0921
Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Date:   Thu Mar 22 16:17:35 2018 -0700

    mm/shmem: do not wait for lock_page() in shmem_unused_huge_shrink()

> [   60.850212] CPU: 0 PID: 221 Comm: sed Not tainted 4.16.0-rc4-00340-g67=
ffc90 #2

--===============4092689797730555971==--

