Content-Type: multipart/mixed; boundary="===============8720475090515528205=="
MIME-Version: 1.0
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf] a0ab2bff12: stderr.Error_opening, size=#Permission_denied
Date: Wed, 20 Nov 2019 16:30:24 +0200
Message-ID: <87pnhmd3i7.fsf@ashishki-desk.ger.corp.intel.com>
In-Reply-To: <20191120135654.GA4261@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8720475090515528205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oliver Sang <oliver.sang@intel.com> writes:

> Hi Alex, sorry for confusion, the error is as below

Hi Oliver,

Thank you for a prompt follow-up!

>   + tests/size/too_big
>     Testing attr > kernel supported size...                    FAILED

It's a problem between the test case and the test system. The commit
mentioned actually increases the sizeof(struct perf_event_attr), which
this test case compiles in. So, if you rebuild the test case against the
updated include/uapi/linux/perf_event.h, it will pass again.

I would say, that for correctness sake it makes sense to rebuild the
testsuite with each new commit, or at least with every commit that
touches include/uapi.

Regards,
--
Alex
--===============8720475090515528205==--

