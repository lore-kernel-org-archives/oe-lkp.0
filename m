Content-Type: multipart/mixed; boundary="===============0124670985073101897=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 24 Aug 2020 15:38:53 +0000
Message-ID: <6e996ad05e434a6fb13f069ee72b876b@intel.com>
In-Reply-To: <20200824153300.GA56944@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0124670985073101897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Yes, that's what we suspected. And I just did another try to force the
> percpu mce structure aligned. And the regression seems to be gone (reduced
> from 14.1% to 2%), which further proved it.

I wonder whether it would be useful for bisection of performance issues
for you to change the global definition of DEFINE_PER_CPU() to make
all per CPU definitions aligned. Just like you switch compiler flags to make
all functions aligned.

-Tony
--===============0124670985073101897==--

