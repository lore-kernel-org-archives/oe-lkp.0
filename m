Content-Type: multipart/mixed; boundary="===============5841680684713801356=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_owner] 866b485262: invoked_oom-killer:gfp_mask=0x
Date: Thu, 29 Jul 2021 11:46:11 -0700
Message-ID: <20210729114611.13ff7c1c43c883bd039dab40@linux-foundation.org>
In-Reply-To: <20210729014019.GA22801@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5841680684713801356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2021 09:40:19 +0800 kernel test robot <oliver.sang@intel.c=
om> wrote:

> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 866b485262173a2b873386162b2ddcfbcb542b4a ("mm/page_owner: record =
the timestamp of all pages during free")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

I don't see how this can happen unless it's a side-effect of making
struct page_owner 8 bytes larger.  Does setting
/proc/sys/vm/oom_dump_tasks tell us more?
--===============5841680684713801356==--

