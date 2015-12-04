Content-Type: multipart/mixed; boundary="===============3033554399260175827=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 81ffdcdd97: kmsg.CPU61:Package_temperature_above_threshold, cpu_clock_throttled(total_events=#)
Date: Fri, 04 Dec 2015 10:25:55 -0800
Message-ID: <20151204182555.GE18534@tassilo.jf.intel.com>
In-Reply-To: <87vb8fqaag.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3033554399260175827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> commit 81ffdcdd97d94110627caa81c23d5d780083731d ("x86/mce: Fix thermal th=
rottling reporting after kexec")
> =

> This may be the intended behavior, just FYI.

Yes, it's intended. Your system is overheating, and I assume 0day uses kexe=
c.
Previously you completely missed these messages because they were disabled
after the first kexec. So now they are correctly reported.

-Andi

> =

> [  228.096596] CPU47: Core temperature above threshold, cpu clock throttl=
ed (total events =3D 1)
> [  228.096597] CPU3: Core temperature above threshold, cpu clock throttle=
d (total events =3D 1)
> [  228.096599] CPU19: Package temperature above threshold, cpu clock thro=
ttled (total events =3D 1)
> [  228.096601] CPU9: Package temperature above threshold, cpu clock throt=
tled (total events =3D 1)
> [  228.096603] CPU53: Package temperature above threshold, cpu clock thro=
ttled (total events =3D 1)

--===============3033554399260175827==--

