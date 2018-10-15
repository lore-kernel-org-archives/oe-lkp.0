Content-Type: multipart/mixed; boundary="===============4692718041867692319=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [sd] 7618616fcd: WARNING:at_drivers/scsi/scsi_lib.c:#scsi_device_quiesce
Date: Mon, 15 Oct 2018 08:22:47 -0700
Message-ID: <1539616967.129692.4.camel@acm.org>
In-Reply-To: <20181015032509.GD28215@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4692718041867692319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-10-15 at 11:25 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 7618616fcdf8a5de9f3dc45fc6281ebd0663bd8a ("sd: Rely on the driver=
 core for asynchronous probing")
> https://github.com/bvanassche/linux for-next
> =

> in testcase: suspend_stress
> with following parameters:
> =

> 	mode: mem
> 	iterations: 10

Hello,

I will look into this and let you know my findings.

Bart.

--===============4692718041867692319==--

