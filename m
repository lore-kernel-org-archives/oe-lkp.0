Content-Type: multipart/mixed; boundary="===============4791204603926993316=="
MIME-Version: 1.0
From: Michal Koutný <mkoutny@suse.com>
To: lkp@lists.01.org
Subject: Re: [cgroup] 3c87862ca1: WARNING:at_kernel/softirq.c:#__local_bh_enable_ip
Date: Thu, 09 Jun 2022 16:55:49 +0200
Message-ID: <20220609145549.GA28484@blackbody.suse.cz>
In-Reply-To: <b39cdb9c-aa2a-0f49-318b-8632b2989433@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4791204603926993316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Tadeusz.

On Thu, Jun 09, 2022 at 07:30:41AM -0700, Tadeusz Struk <tadeusz.struk@li=
naro.org> wrote:
> Are you interested in fixing this at syzbot issue all?

The (original) syzbot report is conditioned by allocation failure that's
unlikely under normal conditions (AFAIU). Hence I don't treat it extra
high urgent.
OTOH, it's interesting and it points to some disparity worth fixing --
so I try helping (as time permits, so far I can only run the reproducers
via the syzbot).

> Do you have any more feedback on this?

Ad the patch v2 with spinlock per css -- that looks like an overkill to
me, I didn't look deeper into it.

Ad the in-thread patch with ancestry css_get(), the ->parent ref:
  - is inc'd in init_and_link_css(),
  - is dec'd in css_free_rwork_fn()
and thanks to ->online_cnt offlining is ordered (child before parent).

Where does your patch dec these ancestry references? (Or why would they
be missing in the first place?)

Thanks for digging into this!
Michal
--===============4791204603926993316==--

