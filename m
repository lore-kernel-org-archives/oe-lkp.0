Content-Type: multipart/mixed; boundary="===============8026282466878612515=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bpf] de05014aba: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Mon, 15 May 2017 14:57:25 -0400
Message-ID: <20170515.145725.74958807751910010.davem@davemloft.net>
In-Reply-To: <20170515081438.GI15250@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8026282466878612515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: kernel test robot <xiaolong.ye@intel.com>
Date: Mon, 15 May 2017 16:14:38 +0800

> commit: de05014aba8054e1353b720b814a0cd8ea7594e5 ("bpf: Introduce bpf_pro=
g ID")
> url: https://github.com/0day-ci/linux/commits/Martin-KaFai-Lau/bpf-Introd=
uce-bpf_prog-ID/20170428-025859

Indeed, we can't use GFP_USER in the call to idr_alloc_cyclic() if it is
going to run with the prog_idr_lock spinlock held.

--===============8026282466878612515==--

