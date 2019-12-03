Content-Type: multipart/mixed; boundary="===============8089732348207847401=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: 5591abb2f5 ("bpf: add poke dependency tracking for prog array .."): BUG: sleeping function called from invalid context at kernel/locking/mutex.c:281
Date: Tue, 03 Dec 2019 16:04:50 +0100
Message-ID: <edf1eaab-9d5a-eb45-2cf0-b93481cfe531@iogearbox.net>
In-Reply-To: <5de66d8a.HFlHHCLiajbQFtEe%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8089732348207847401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/3/19 3:13 PM, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/bpf.git pr/bpf-t=
ail-call-rebased2
> =

> commit 5591abb2f539d0b4dfd98028bc08a383ba8448e7
> Author:     Daniel Borkmann <daniel@iogearbox.net>
> AuthorDate: Thu Nov 14 00:12:37 2019 +0100
> Commit:     Daniel Borkmann <daniel@iogearbox.net>
> CommitDate: Thu Nov 14 09:49:32 2019 +0100
> =

>      bpf: add poke dependency tracking for prog array maps
>      =

>      Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>

(Thanks for the report, this is an old branch of mine. The work where this =
should be fixed is
  in bpf / bpf-next.)
--===============8089732348207847401==--

