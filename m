Content-Type: multipart/mixed; boundary="===============2998238318598965478=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 7bb39313cd: netperf.Throughput_tps -4.5% regression
Date: Tue, 19 Jan 2021 11:02:55 +0100
Message-ID: <20210119100255.GC27433@zn.tnic>
In-Reply-To: <20210119042721.GA12664@paulmck-ThinkPad-P72>
List-Id: <oe-lkp.lists.linux.dev>

--===============2998238318598965478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 08:27:21PM -0800, Paul E. McKenney wrote:
> I bet that the results vary depending on the type of CPU, and also on
> the kernel address-space layout, which of course also varies based on
> the Kconfig options.  Let's see how the maintainers would like to proceed.

So I ran the "reproduce" script in the original mail on a KBL box here
with the .config tailored for it:

cpu family      : 6
model           : 158
model name      : Intel(R) Core(TM) i5-9600K CPU @ 3.70GHz
stepping        : 12
microcode       : 0xd6

and I get mixed results. But I'd need to know how exactly they generate
the metrics "netperf.Throughput_total_tps" and "netperf.Throughput_tps"

Feng?

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============2998238318598965478==--

