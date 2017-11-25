Content-Type: multipart/mixed; boundary="===============4843970925542650966=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 2569321dd4 ("page cache: Convert page_cache_tree_delete to xarray"): WARNING: CPU: 0 PID: 137 at mm/shmem.c:1084 shmem_evict_inode
Date: Sat, 25 Nov 2017 21:47:27 +0800
Message-ID: <20171125134727.6yhsonac4irfq2rc@wfg-t540p.sh.intel.com>
In-Reply-To: <MWHPR21MB0845F1EBD0A53FBC5F961FF0CB260@MWHPR21MB0845.namprd21.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4843970925542650966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On Fri, Nov 24, 2017 at 04:25:12PM +0000, Matthew Wilcox wrote:
>Actually, I rebased this branch to fix a commit 18 (!) commits earlier tha=
n the one which was flagged here, which was where the real problem lay.
>
>Thank you so much for 0-day; you're finding so many bugs for me!

You are welcome! :)

Thanks,
Fengguang

--===============4843970925542650966==--

