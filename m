Content-Type: multipart/mixed; boundary="===============3507237797413824645=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Fri, 29 Apr 2016 16:59:37 +0800
Message-ID: <20160429085937.GA20922@aaronlu.sh.intel.com>
In-Reply-To: <20160428112135.GD31489@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3507237797413824645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 01:21:35PM +0200, Michal Hocko wrote:
> All of them are order-2 and this was a known problem for "mm, oom:
> rework oom detection" commit and later should make it much more
> resistant to failures for higher (!costly) orders. So I would definitely
> encourage you to retest with the current _complete_ mmotm tree.

OK, will run the test on this branch:
https://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-4.5
with head commit:
commit 81cc2e6f1e8bd81ebc7564a3cd3797844ee1712e
Author: Michal Hocko <mhocko@suse.com>
Date:   Thu Apr 28 12:03:24 2016 +0200

    drm/amdgpu: make amdgpu_mn_get wait for mmap_sem killable

Please let me know if this isn't right.

--===============3507237797413824645==--

