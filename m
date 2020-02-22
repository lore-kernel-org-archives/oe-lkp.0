Content-Type: multipart/mixed; boundary="===============8783008079841926634=="
MIME-Version: 1.0
From: Kleen, Andi <andi.kleen@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Sat, 22 Feb 2020 17:08:20 +0000
Message-ID: <E8ECBC65D0B2554DAD44EBE43059B3740F2241@ORSMSX110.amr.corp.intel.com>
In-Reply-To: <20200222124359.GA86836@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8783008079841926634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>Thanks for the suggestion, I tried this and the 5.5 regrssion is gone!
>which also confirms the offset for the bulk of stuff following "pmu"
>causes the performance drop.

Okay that confirms that it is false sharing. Looking at c2c is the right wa=
y to
go then.

Peter, could adopt the padding as a workaround for now?

-Andi
--===============8783008079841926634==--

