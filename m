Content-Type: multipart/mixed; boundary="===============3184268578587561756=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] 939c7a4f04f: -46.4% cpuidle.C3-IVT.time
Date: Wed, 18 Jun 2014 13:27:08 -0400
Message-ID: <20140618132708.38f1a7fc@gandalf.local.home>
In-Reply-To: <53A10460.1040705@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3184268578587561756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Jun 2014 11:15:44 +0800
Jet Chen <jet.chen@intel.com> wrote:

> Hi Yoshihiro,
> =

> FYI, we noticed the below changes on
> =

> commit 939c7a4f04fcd2162109744e8bf88194948a6e65 ("tracing: Introduce save=
d_cmdlines_size file")
> =

> test case: brickland3/aim7/3000-brk_test

Um, do these tests run with tracing enabled and on? If not, the code in
the above mentioned commit is never executed.

Something may be whacky with your bisect.

-- Steve

> =

> beba4bb096201ce  939c7a4f04fcd2162109744e8
> ---------------  -------------------------


--===============3184268578587561756==--

