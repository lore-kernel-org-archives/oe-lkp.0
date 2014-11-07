Content-Type: multipart/mixed; boundary="===============3483622974333674250=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86_64,entry] f04e05b81e4: -62.7% time.user_time
Date: Thu, 06 Nov 2014 22:26:23 -0800
Message-ID: <CALCETrVBcZ=5YJMzjKwFpjz6p32FmXcdkR=8uSPm8kCECDka4g@mail.gmail.com>
In-Reply-To: <20141107060040.GD30507@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3483622974333674250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2014 at 10:00 PM, LKP <lkp@01.org> wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry
> commit f04e05b81e4d9ae88bee379f12176f551a24394a ("x86_64,entry: Use sysre=
t to return to userspace when possible")
>
>
> f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  testbox/testcase/testparams
> ----------------  --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      24.09 =C2=B1  4%     -62.7%       8.99 =C2=B1  3%  lkp-wsx02/aim9/pe=
rformance-300s-creat-clo
>      24.09           -62.7%       8.99        GEO-MEAN time.user_time
>

I don't really know how to interpret this.  Is this a good thing or a bad t=
hing?

I actually expect this change to be a dramatic speedup for some
workloads.  Any chance you can send me the .config, kernel command
line, and whether you have any tracing features enabled?

--Andy

--===============3483622974333674250==--

