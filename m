Content-Type: multipart/mixed; boundary="===============5381737832196277463=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [clockevents] d5a085970b0: -9.2% will-it-scale.per_thread_ops
Date: Thu, 26 Jun 2014 09:46:48 +0800
Message-ID: <20140626014648.GC12239@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5381737832196277463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

I'm not sure how the simple commit will impact will-it-scale/pwrite2
throughput. Just in case you can see more clues.

git://git.linaro.org/people/vireshk/linux tick/ONESHOT-STOPPED
commit d5a085970b0b88b8c82303d2c45f09c9427fd02a ("clockevents: x86: add sup=
port for ONESHOT_STOPPED mode")

test case: nhm4/will-it-scale/pwrite2

f4f5df6f142f679  d5a085970b0b88b8c82303d2c  =

---------------  -------------------------  =

    773859 ~ 0%      -9.2%     702704 ~ 0%  TOTAL will-it-scale.per_thread_=
ops

Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent

Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

Thanks,
Fengguang

--===============5381737832196277463==--

