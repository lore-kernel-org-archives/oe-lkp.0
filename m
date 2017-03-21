Content-Type: multipart/mixed; boundary="===============0481466473157954792=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Tue, 21 Mar 2017 09:11:14 -0700
Message-ID: <CAJcbSZEG1eWsM4ACjGGE0RJt8qZ1vZPM0Pg3JmPVG5RXD24Lgg@mail.gmail.com>
In-Reply-To: <20170320014030.GK548@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0481466473157954792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2017 at 6:40 PM, Ye Xiaolong <xiaolong.ye@intel.com> wrot=
e:
> Could you paste the error log?
> I suspect it was caused by job-script saved as dos format, you may try
> `dos2unix job-script` before "lkp qemu" to see whether it works.
>

You were right, I had some strange '\n' error in the middle of a lot
of them. dos2unix on the job script fixed the issue.

-- =

Thomas

--===============0481466473157954792==--

