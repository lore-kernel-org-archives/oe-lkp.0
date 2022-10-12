Content-Type: multipart/mixed; boundary="===============6407101649972488516=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [kernfs] a52dfbd520: WARNING:at_fs/kernfs/file.c:#kernfs_drain_open_files
Date: Wed, 12 Oct 2022 08:46:49 -1000
Message-ID: <Y0cLEOZ6wOpPjprj@slm.duckdns.org>
In-Reply-To: <202210120948.2956769e-oliver.sang@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6407101649972488516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 09:43:44AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: a52dfbd5209acffb90a71cbe4259450e6657cc97 ("kernfs: Skip kernfs_dr=
ain_open_files() more aggressively")
> https://git.kernel.org/cgit/linux/kernel/git/tj/misc.git kernfs-deactivate

For the record, I believe this is already fixed in the v2 of the patch which
is merged as bdb2fd7fc56e197a63c0b0e7e07d25d5e20e7c72.

Thanks.

-- =

tejun
--===============6407101649972488516==--

