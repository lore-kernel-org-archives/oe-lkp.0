Content-Type: multipart/mixed; boundary="===============0949898641248302948=="
MIME-Version: 1.0
From: Ming Lei <tom.leiming@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi] 5c279bd9e4: blogbench.read_score -10.0% regression
Date: Thu, 06 Jul 2017 07:45:27 +0800
Message-ID: <CACVXFVNWpWb0f-tp2r82Juzq3QH2Prw_gzqVY9tySnAQsLg2Kg@mail.gmail.com>
In-Reply-To: <20170703025722.GG7070@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0949898641248302948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

On Mon, Jul 3, 2017 at 10:57 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a -10.0% regression of blogbench.read_score due to commit:

Looks like related with mq scheduler, could you test the following patch to=
 see
if your issue can be fixed?

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commi=
t/?h=3Dfor-linus&id=3D32825c45ff8f4cce937ab85b030dc693ceb1aa0a


Thanks,
Ming Lei

--===============0949898641248302948==--

