Content-Type: multipart/mixed; boundary="===============0365115514936667568=="
MIME-Version: 1.0
From: Stefano Brivio <sbrivio@redhat.com>
To: lkp@lists.01.org
Subject: Re: [netfilter] e32a4dc651: BUG:using_smp_processor_id()in_preemptible
Date: Fri, 05 Jun 2020 00:23:23 +0200
Message-ID: <20200605002323.501b1cc6@redhat.com>
In-Reply-To: <20200603084934.GF12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0365115514936667568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 3 Jun 2020 16:49:34 +0800
kernel test robot <lkp@intel.com> wrote:

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: e32a4dc6512ce3c1a1920531246e7037896e510a ("netfilter: nf_tables: =
make sets built-in")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: kernel-selftests
> with following parameters:
> =

> 	group: kselftests-netfilter

I couldn't find this information in the report. Would it be possible to
have here an indication of what kselftest specifically is failing?
There are a number of tests in that group. I have an obvious suspicion
here (nft_concat_range.sh), but it would be nice to know, in general.

> [...]
>
> [  165.316525] BUG: using smp_processor_id() in preemptible [00000000] co=
de: nft/6247
> [  165.319547] caller is nft_pipapo_insert+0x464/0x610 [nf_tables]

I'll take care of this, thanks Florian for forwarding.

-- =

Stefano

--===============0365115514936667568==--

