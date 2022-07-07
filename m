Content-Type: multipart/mixed; boundary="===============5878683315094530836=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] 638ab1768a: aim7.jobs-per-min 6.2% improvement
Date: Thu, 07 Jul 2022 16:40:15 +0200
Message-ID: <20220707144015.GD15169@suse.cz>
In-Reply-To: <YsGZXV7qW6bedSlc@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5878683315094530836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 03, 2022 at 09:27:57PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a 6.2% improvement of aim7.jobs-per-min due to commit:
> =

> =

> commit: 638ab1768a6abb9b1280783e93a3de9a95f23af8 ("btrfs: remove redundan=
t check in up check_setget_bounds")
> https://github.com/kdave/btrfs-devel.git dev/send-v2-my-wip

Though it's on some development branch, the patch has been added to
misc-next as well and the perf improvement is on par with the estimate
5% for metadata heavy workloads. Thanks.
--===============5878683315094530836==--

