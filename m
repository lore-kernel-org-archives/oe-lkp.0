Content-Type: multipart/mixed; boundary="===============2800200500430504935=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/build] b2c51106c75: -18.1% will-it-scale.per_process_ops
Date: Wed, 05 Aug 2015 10:38:58 +0200
Message-ID: <20150805083858.GA21506@gmail.com>
In-Reply-To: <87pp37y4cy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2800200500430504935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <ying.huang@intel.com> wrote:

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
> commit b2c51106c7581866c37ffc77c5d739f3d4b7cbc9 ("x86/build: Fix detectio=
n of GCC -mpreferred-stack-boundary support")

Does the performance regression go away reproducibly if you do:

   git revert b2c51106c7581866c37ffc77c5d739f3d4b7cbc9

?

Thanks,

	Ingo

--===============2800200500430504935==--

