Content-Type: multipart/mixed; boundary="===============5781585921286060380=="
MIME-Version: 1.0
From: Sandeep Kumar <sandeepdas.cse@gmail.com>
To: lkp@lists.01.org
Subject: CONFIG_NO_HZ_FULL=y Kernel config performance issue
Date: Wed, 24 Aug 2016 14:42:27 +0530
Message-ID: <CAPtPDjZkVZguLydt1q3PAKGT3igTFj-3e06uH6MYca=re7_49A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5781585921286060380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Team,

We've been carrying out some experiments on our kernel configuration to
improve our performance. We came across following configuration parameters:

*CONFIG_NO_HZ_FULL*: Omit scheduling-clock ticks on CPUs that are either
idle or that have only one runnable task. Unless you are running realtime
applications or certain types of HPC workloads, you will normally not want
this option.

*CONFIG_NO_HZ_IDLE*: Omit scheduling-clock ticks on idle CPUs
(CONFIG_NO_HZ_IDLE=3Dy or CONFIG_NO_HZ=3Dy for older kernels). This is the =
most
common approach, and should be the default

According to the description given in our kernel make menuconfig the
parameter "CONFIG_NO_HZ_FULL" was supposed to improve our performance since
we are running single task per CPU i.e. binding threads to physical core
id. Ironically it degraded our performance to double amount. By default
configuration is set to "CONFIG_NO_HZ_IDLE". Our entire program is running
in user space basically its carrying out following task:

1. Read data from SHM.
2. Carry out some operations in user space
3. Send data over TCP socket using kernel bypass mode.

System CPU used by this thread is negligible following are the stats for
context switches taking place:
voluntary_ctxt_switches:        15
nonvoluntary_ctxt_switches:     1196

The non voluntary context switch is due to vm.stat collection which is
happening per second basis. We are referring following kernel
documentation.
https://www.kernel.org/doc/Documentation/timers/NO_HZ.txt

We've also offloaded our RCU callbacks using kernel command line parameter
"rcu_nocbs=3D<CPU-ID>".

Is there anything else which we are missing to get this parameter setup
properly? Our application is latency sensitive and we were hoping that
after reducing ticks the latency of the application will improve.

Any input is highly appreciated. Let me know if more details are required.

Regards,
Sandeep

--===============5781585921286060380==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PkhpIFRlYW0sPGJyPjxicj48L2Rpdj48ZGl2PldlJiMz
OTt2ZSBiZWVuIGNhcnJ5aW5nIG91dCBzb21lIGV4cGVyaW1lbnRzIG9uIG91ciBrZXJuZWwgY29u
ZmlndXJhdGlvbiB0byBpbXByb3ZlIG91ciBwZXJmb3JtYW5jZS4gV2UgY2FtZSBhY3Jvc3MgZm9s
bG93aW5nIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVyczo8YnI+PHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OmFyaWFsLGhlbHZldGljYSxzYW5zLXNlcmlmIj48Yj48YnI+Q09ORklHX05PX0haX0ZVTEw8
L2I+OiBPbWl0IHNjaGVkdWxpbmctY2xvY2sgdGlja3Mgb24gQ1BVcyB0aGF0IGFyZSBlaXRoZXIg
aWRsZSBvciB0aGF0IGhhdmUgb25seSBvbmUgcnVubmFibGUgdGFzay4gIFVubGVzcyB5b3U8L3Nw
YW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLGhlbHZldGljYSxzYW5zLXNlcmlmIj4g
YXJlIHJ1bm5pbmcgcmVhbHRpbWUgYXBwbGljYXRpb25zIG9yIGNlcnRhaW4gdHlwZXMgb2YgSFBD
IHdvcmtsb2FkcywgeW91IHdpbGwgbm9ybWFsbHkgbm90IHdhbnQgdGhpcyBvcHRpb24uPGJyPjxi
cj48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLGhlbHZldGljYSxzYW5zLXNl
cmlmIj48L3NwYW4+PGI+Q09ORklHX05PX0haX0lETEU8L2I+OgogT21pdCBzY2hlZHVsaW5nLWNs
b2NrIHRpY2tzIG9uIGlkbGUgQ1BVcyAoQ09ORklHX05PX0haX0lETEU9eSBvcgkKQ09ORklHX05P
X0haPXkgZm9yIG9sZGVyIGtlcm5lbHMpLiAgVGhpcyBpcyB0aGUgbW9zdCBjb21tb24gYXBwcm9h
Y2gsIAphbmQgc2hvdWxkIGJlIHRoZSBkZWZhdWx0PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+QWNjb3JkaW5nIHRvIHRoZSBkZXNjcmlwdGlvbiBnaXZlbiBpbiBvdXIga2VybmVsIG1ha2Ug
bWVudWNvbmZpZyB0aGUgcGFyYW1ldGVyICZxdW90O0NPTkZJR19OT19IWl9GVUxMJnF1b3Q7IHdh
cyBzdXBwb3NlZCB0byBpbXByb3ZlIG91ciBwZXJmb3JtYW5jZSBzaW5jZSB3ZSBhcmUgcnVubmlu
ZyBzaW5nbGUgdGFzayBwZXIgQ1BVIGkuZS4gYmluZGluZyB0aHJlYWRzIHRvIHBoeXNpY2FsIGNv
cmUgaWQuIElyb25pY2FsbHkgaXQgZGVncmFkZWQgb3VyIHBlcmZvcm1hbmNlIHRvIGRvdWJsZSBh
bW91bnQuIEJ5IGRlZmF1bHQgY29uZmlndXJhdGlvbiBpcyBzZXQgdG8gJnF1b3Q7Q09ORklHX05P
X0haX0lETEUmcXVvdDsuIE91ciBlbnRpcmUgcHJvZ3JhbSBpcyBydW5uaW5nIGluIHVzZXIgc3Bh
Y2UgYmFzaWNhbGx5IGl0cyBjYXJyeWluZyBvdXQgZm9sbG93aW5nIHRhc2s6PGJyPjxicj48L2Rp
dj48ZGl2PjEuIFJlYWQgZGF0YSBmcm9tIFNITS48YnI+PC9kaXY+PGRpdj4yLiBDYXJyeSBvdXQg
c29tZSBvcGVyYXRpb25zIGluIHVzZXIgc3BhY2U8YnI+PC9kaXY+PGRpdj4zLiBTZW5kIGRhdGEg
b3ZlciBUQ1Agc29ja2V0IHVzaW5nIGtlcm5lbCBieXBhc3MgbW9kZS7CoCA8YnI+PGJyPjwvZGl2
PjxkaXY+U3lzdGVtIENQVSB1c2VkIGJ5IHRoaXMgdGhyZWFkIGlzIG5lZ2xpZ2libGUgZm9sbG93
aW5nIGFyZSB0aGUgc3RhdHMgZm9yIGNvbnRleHQgc3dpdGNoZXMgdGFraW5nIHBsYWNlOjxicj52
b2x1bnRhcnlfY3R4dF9zd2l0Y2hlczrCoMKgwqDCoMKgwqDCoCAxNTxicj5ub252b2x1bnRhcnlf
Y3R4dF9zd2l0Y2hlczrCoMKgwqDCoCAxMTk2IDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlRoZSBub24gdm9sdW50YXJ5IGNvbnRleHQgc3dpdGNoIGlzIGR1ZSB0byB2bS5zdGF0IGNvbGxl
Y3Rpb24gd2hpY2ggaXMgaGFwcGVuaW5nIHBlciBzZWNvbmQgYmFzaXMuIFdlIGFyZSByZWZlcnJp
bmcgZm9sbG93aW5nIGtlcm5lbCBkb2N1bWVudGF0aW9uLiA8YnI+PGEgaHJlZj0iaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi90aW1lcnMvTk9fSFoudHh0Ij5odHRwczov
L3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL3RpbWVycy9OT19IWi50eHQ8L2E+IDxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldlJiMzOTt2ZSBhbHNvIG9mZmxvYWRlZCBvdXIg
UkNVIGNhbGxiYWNrcyB1c2luZyBrZXJuZWwgY29tbWFuZCBsaW5lIHBhcmFtZXRlciAmcXVvdDty
Y3Vfbm9jYnM9Jmx0O0NQVS1JRCZndDsmcXVvdDsuIDxicj48YnI+PC9kaXY+PGRpdj5JcyB0aGVy
ZSBhbnl0aGluZyBlbHNlIHdoaWNoIHdlIGFyZSBtaXNzaW5nIHRvIGdldCB0aGlzIHBhcmFtZXRl
ciBzZXR1cCBwcm9wZXJseT8gT3VyIGFwcGxpY2F0aW9uIGlzIGxhdGVuY3kgc2Vuc2l0aXZlIGFu
ZCB3ZSB3ZXJlIGhvcGluZyB0aGF0IGFmdGVyIHJlZHVjaW5nIHRpY2tzIHRoZSBsYXRlbmN5IG9m
IHRoZSBhcHBsaWNhdGlvbiB3aWxsIGltcHJvdmUuIDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PkFueSBpbnB1dCBpcyBoaWdobHkgYXBwcmVjaWF0ZWQuIExldCBtZSBrbm93IGlmIG1vcmUg
ZGV0YWlscyBhcmUgcmVxdWlyZWQuIDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj5SZWdhcmRzLDxi
cj48L2Rpdj5TYW5kZWVwPGJyPjwvZGl2Pgo=

--===============5781585921286060380==--

