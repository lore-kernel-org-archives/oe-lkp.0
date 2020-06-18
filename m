Content-Type: multipart/mixed; boundary="===============3193170005438352933=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: lkp@lists.01.org
Subject: Re: [pipe] 566d136289: stress-ng.tee.ops_per_sec -84.7% regression
Date: Thu, 18 Jun 2020 14:17:52 +0900
Message-ID: <0cc7fed8-faaf-459a-8b78-a9f66b556c1d@i-love.sakura.ne.jp>
In-Reply-To: <20200618005117.GB5279@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3193170005438352933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020/06/18 9:51, kernel test robot wrote:
> FYI, we noticed a -84.7% regression of stress-ng.tee.ops_per_sec due to c=
ommit:
> =

> =

> commit: 566d136289dc57816ac290de87a9a0f7d9bd3cbb ("pipe: Fix pipe_full() =
test in opipe_prep().")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This would be because the test case shows higher performance if the pipe wr=
iter does busy wait.
This commit fixed an unkillable busy wait bug when the pipe reader does not=
 try to read.

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>

We can't fix the issue. ;-)

--===============3193170005438352933==--

