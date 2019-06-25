Content-Type: multipart/mixed; boundary="===============8735105250274771361=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/hotplug] e1056a25da: WARNING:at_arch/x86/kernel/apic/apic.c:#setup_local_APIC
Date: Tue, 25 Jun 2019 09:46:01 +0800
Message-ID: <58ea508f-dc2e-8537-fe96-49cca0a7c799@intel.com>
In-Reply-To: <alpine.DEB.2.21.1906212108150.5503@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8735105250274771361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/22/19 3:08 AM, Thomas Gleixner wrote:
> On Thu, 20 Jun 2019, kernel test robot wrote:
>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: e1056a25daa6460c95e92d7d6853d05ad62458f7 ("x86/hotplug: Silence =
APIC and NMI when CPU is dead")
>> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.x86/ipi
>>
>> in testcase: locktorture
>> with following parameters:
>>
>> 	runtime: 300s
>> 	test: cpuhotplug
>>
>> test-description: This torture test consists of creating a number of ker=
nel threads which acquire the lock and hold it for specific amount of time,=
 thus simulating different critical region behaviors.
>> test-url: https://www.kernel.org/doc/Documentation/locking/locktorture.t=
xt
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 2G
> I cannot reproduce that issue. What's the underlying hardware machine?

brand: Genuine Intel(R) CPU 000 @ 2.27GHz
model: Westmere-EX
memory: 256G
nr_node: 4
nr_cpu: 80

Best Regards,
Rong Chen


>
> Thanks,
>
> 	tglx

--===============8735105250274771361==--

