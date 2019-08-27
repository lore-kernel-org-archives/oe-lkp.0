Content-Type: multipart/mixed; boundary="===============5269836044401817610=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [bpf, lru] 107e215c29: kernel_selftests.bpf.test_lru_map.fail
Date: Tue, 27 Aug 2019 10:00:36 +0200
Message-ID: <4f418599-b959-30c5-657e-ade16c0f62b6@iogearbox.net>
In-Reply-To: <20190827002724.GC22771@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5269836044401817610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/27/19 2:27 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 107e215c2962c00c79351b4bfc2d3c0fe7df50f6 ("bpf, lru: avoid messin=
g with eviction heuristics upon syscall lookup")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux-sta=
ble-rc.git linux-4.19.y

That is expected, the fix has been backported to 4.19, but without the corr=
esponding
BPF kselftest changes. The latter has way too much churn to be a reasonable=
 candidate
for stable kernels.

Thanks,
Daniel

--===============5269836044401817610==--

