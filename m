Content-Type: multipart/mixed; boundary="===============4927472901388232857=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Wed, 27 Jan 2021 22:28:59 +0106
Message-ID: <87bldaaxcc.fsf@jogness.linutronix.de>
In-Reply-To: <YA+gAV1kW8Ru1+Bo@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============4927472901388232857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-26, Sergey Senozhatsky <sergey.senozhatsky@gmail.com> wrote:
> AFAIU this is just 'modprobe rcutorture'

I was finally able to trigger this by using my workstation:

    Intel(R) Core(TM) i5-8259U CPU @ 2.30GHz
    Debian/buster
    QEMU 3.1.0 (Debian 1:3.1+dfsg-8+deb10u8)

instead of my build server:

    Intel(R) Xeon(R) CPU E5-2697 v4 @ 2.30GHz
    Debian/bullseye
    QEMU 5.2.0 (Debian 1:5.2+dfsg-3)

I don't know what factors contributed, but I wanted to share my success
in reproducing the reported problem. Instead of using lkp, I am manually
booting with:

$ kvm -cpu host -smp 2 -m 8G -nographic \
      -kernel bzImage -append "console=3DttyS0,115200 loglevel=3D6" \
      -initrd initrd

My initrd is a minimal busybox rootfs that runs:

# modprobe rcutorture onoff_interval=3D3 onoff_holdoff=3D30 torture_type=3D=
tasks

(Those are the same modprobe parameters used by the lkp job.)

After about a minute I see:

[   47.268292] tasks-torture: rcu_torture_read_exit: Start of episode
[   51.273365] tasks-torture: rcu_torture_read_exit: End of episode
[   55.823306] smpboot: do_boot_cpu failed(-1) to wakeup CPU#0
[   55.824350] tasks-torture:torture_onoff task: online 0 failed: errno -5
[   55.830661] tasks-torture:torture_onoff task: online 0 failed: errno -5
[   55.848524] tasks-torture:torture_onoff task: online 0 failed: errno -5

I will start to debug this now.

John Ogness
--===============4927472901388232857==--

