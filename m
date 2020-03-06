Content-Type: multipart/mixed; boundary="===============3221131176178020488=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [y2038] 412c53a680: will-it-scale.per_process_ops 11.7% improvement
Date: Thu, 05 Mar 2020 19:53:17 -0800
Message-ID: <20200305195317.771bd8fd1f308172d26a51fe@linux-foundation.org>
In-Reply-To: <20200305062138.GI5972@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3221131176178020488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Mar 2020 14:21:38 +0800 kernel test robot <rong.a.chen@intel.co=
m> wrote:

> FYI, we noticed a 11.7% improvement of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 412c53a680a97cb1ae2c0ab60230e193bee86387 ("y2038: remove unused t=
ime32 interfaces")

That patch merely removed unused code!
--===============3221131176178020488==--

