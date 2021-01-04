Content-Type: multipart/mixed; boundary="===============8304683157012767158=="
MIME-Version: 1.0
From: Joonsoo Kim <js1304@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/swap] aae466b005: vm-scalability.throughput -2.7% regression
Date: Mon, 04 Jan 2021 10:24:10 +0900
Message-ID: <20210104012356.GA5941@js1304-desktop>
In-Reply-To: <20201230062412.GD22185@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8304683157012767158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 02:24:12PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -2.7% regression of vm-scalability.throughput due to co=
mmit:
> =

> =

> commit: aae466b0052e1888edd1d7f473d4310d64936196 ("mm/swap: implement wor=
kingset detection for anonymous LRU")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Hello,

Thanks for reporting.

This is a known issue to me. As you can see below, slight regression
is found on only the random access workload. For pure random pattern,
detecting workingset would not guarantee a good result since these
pages doesn't accessed in the near future. Even worse, it causes small
overhead to the system since we need to demote these activated page to
the inactive list to reclaim. So, below result is natural to me.

For other access pattern, this patchset would result in positive
effect.

Thanks.

--===============8304683157012767158==--

