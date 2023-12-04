-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2023 at 08:50 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inv_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(15) NOT NULL,
  `division_address` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `company_id`, `name`, `short_name`, `division_address`) VALUES
(1, 8, 'E-Engineering', '', ''),
(2, 0, 'PEAM', '', ''),
(3, 11, 'Maxon Power', '', ''),
(4, 11, 'Generator Sales', '', ''),
(5, 7, 'Corporate', '', ''),
(6, 7, 'Battery', '', ''),
(7, 10, 'Renewable Energy', '', ''),
(8, 11, 'Sub Station', '', ''),
(9, 8, 'Equipment', '', ''),
(10, 11, 'Spare Parts', '', ''),
(11, 0, 'Service And Energy Business', '', ''),
(12, 0, 'SPOT', '', ''),
(13, 0, 'CTED-Dhaka', '', ''),
(14, 0, 'CTED-CTG', '', ''),
(16, 19, '88 Innovations Engineering Ltd', '88i', 'Khawaja Tower, 7th Floor,95\r\nBir Uttam A. K. Khandokar Road,Mohakhali C/A, Dhaka - 1212');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `building_type` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chart_data_column`
--

CREATE TABLE `chart_data_column` (
  `month` varchar(10) NOT NULL,
  `sale` int(3) NOT NULL,
  `profit` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `company_address`) VALUES
(7, 'Saif Powertec Ltd.', '95, Mohakhali'),
(8, 'E-Engineering Ltd.', ''),
(9, 'Saif Port Holdings Ltd.', ''),
(10, 'Saif Electrical Manufacturing Ltd.', ''),
(11, 'Maxon Power Ltd.', ''),
(12, 'Saif Plastic & Polymer Industries Ltd.', ''),
(14, 'Blueline Communications Ltd.', ''),
(15, 'Saif Sporting Club Ltd.', ''),
(16, 'Grihayan Ltd.', ''),
(19, '88 Innovations Engineering Ltd', 'Khawaja Tower, 7th Floor,95\r\nBir Uttam A. K. Khandokar Road,Mohakhali C/A, Dhaka - 1212');

-- --------------------------------------------------------

--
-- Table structure for table `complain_type`
--

CREATE TABLE `complain_type` (
  `id` int(11) NOT NULL,
  `complain_type` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `branch_name` varchar(350) NOT NULL COMMENT 'temprary purpose',
  `name` varchar(650) NOT NULL,
  `short_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `company_id`, `branch_id`, `branch_name`, `name`, `short_name`) VALUES
(1, 8, 1, 'E-Engineering', 'Management', 'MAN'),
(2, 8, 1, 'E-Engineering', 'Market Development', ''),
(3, 0, 1, 'E-Engineering', 'Finance And Accounts', ''),
(4, 0, 1, 'E-Engineering', 'Administration', ''),
(5, 0, 1, 'E-Engineering', 'Dredging', ''),
(6, 0, 1, 'E-Engineering', 'Engineering', ''),
(7, 0, 1, 'E-Engineering', 'Project ENG', ''),
(8, 0, 1, 'E-Engineering', 'Operation', ''),
(9, 0, 1, 'E-Engineering', 'Maintenance', ''),
(10, 0, 1, 'E-Engineering', 'QMS', ''),
(11, 0, 1, 'E-Engineering', 'Mechanical', ''),
(12, 0, 1, 'E-Engineering', 'Civil', ''),
(13, 0, 1, 'E-Engineering', 'Commercial', ''),
(14, 0, 1, 'E-Engineering', 'Store', ''),
(15, 0, 2, 'PEAM', 'Engineering', ''),
(16, 0, 2, 'PEAM', 'Civil', ''),
(17, 0, 3, 'Maxon Power', 'Management', ''),
(18, 0, 3, 'Maxon Power', 'Administration', ''),
(19, 0, 3, 'Maxon Power', 'Project', ''),
(20, 0, 3, 'Maxon Power', 'Finance And Accounts', ''),
(21, 0, 4, 'Generator Sales', 'Sales And Marketing', ''),
(22, 0, 4, 'Generator Sales', 'Service', ''),
(23, 0, 4, 'Generator Sales', 'Project', ''),
(24, 0, 4, 'Generator Sales', 'Administration', ''),
(25, 0, 4, 'Generator Sales', 'Finance And Accounts', ''),
(26, 0, 5, 'Corporate', 'Management', ''),
(27, 0, 5, 'Corporate', 'Finance And Accounts', ''),
(28, 0, 5, 'Corporate', 'QMS', ''),
(29, 0, 5, 'Corporate', 'Human Resource Management', ''),
(30, 0, 5, 'Corporate', 'Purchase And Procurement', ''),
(31, 0, 5, 'Corporate', 'Legal', ''),
(32, 0, 5, 'Corporate', 'Administration', ''),
(33, 0, 5, 'Corporate', 'IT', ''),
(34, 0, 5, 'Corporate', 'Commercial', ''),
(35, 0, 5, 'Corporate', 'Project', ''),
(36, 0, 5, 'Corporate', 'Business Development', ''),
(37, 0, 5, 'Corporate', 'Brand Communication', ''),
(38, 0, 5, 'Corporate', 'Share Market', ''),
(39, 0, 5, 'Corporate', 'Enterprise Resource Planning', ''),
(40, 0, 5, 'Corporate', 'Operation', ''),
(41, 0, 5, 'Corporate', 'Service And WSS', ''),
(42, 0, 6, 'Battery', 'Management', ''),
(43, 0, 6, 'Battery', 'Commercial', ''),
(44, 0, 6, 'Battery', 'Project Development And Implemantaion', ''),
(45, 0, 6, 'Battery', 'RAndD', ''),
(46, 0, 6, 'Battery', 'Factory Operation', ''),
(47, 0, 6, 'Battery', 'Administration', ''),
(48, 0, 6, 'Battery', 'Finance And Accounts', ''),
(49, 0, 6, 'Battery', 'Plate Preparation', ''),
(50, 0, 6, 'Battery', 'Charging', ''),
(51, 0, 6, 'Battery', 'Quality Assurance', ''),
(52, 0, 6, 'Battery', 'Maintenance', ''),
(53, 0, 6, 'Battery', 'Warehouse And Logistics', ''),
(54, 0, 6, 'Battery', 'Assembly', ''),
(55, 0, 6, 'Battery', 'CMP', ''),
(56, 0, 6, 'Battery', 'Service And WSS', ''),
(57, 0, 6, 'Battery', 'QMS', ''),
(58, 0, 6, 'Battery', 'Sales And Marketing', ''),
(59, 0, 6, 'Battery', 'IT', ''),
(60, 0, 6, 'Battery', 'Marketing And Sales- Export And Corporate', ''),
(61, 0, 6, 'Battery', 'MC', ''),
(62, 0, 6, 'Battery', 'Sales Operation', ''),
(63, 0, 6, 'Battery', 'Planning And Coordination', ''),
(64, 0, 6, 'Battery', 'Store', ''),
(65, 0, 6, 'Battery', 'Gel And VRLA', ''),
(66, 0, 6, 'Battery', 'Purchase And Procurement', ''),
(67, 0, 7, 'Renewable Energy', 'Management', ''),
(68, 0, 7, 'Renewable Energy', 'Operation', ''),
(69, 0, 7, 'Renewable Energy', 'Finance And Accounts', ''),
(70, 0, 7, 'Renewable Energy', 'Administration', ''),
(71, 0, 7, 'Renewable Energy', 'Service And Maintanance', ''),
(72, 0, 7, 'Renewable Energy', 'Sales And Marketing', ''),
(73, 0, 7, 'Renewable Energy', 'Store', ''),
(74, 0, 8, 'Sub Station', 'Project', ''),
(75, 0, 8, 'Sub Station', 'Switch Gear', ''),
(76, 0, 8, 'Sub Station', 'Operation', ''),
(77, 0, 8, 'Sub Station', 'Administration', ''),
(78, 0, 9, 'Equipment', 'Sales And Marketing', ''),
(79, 0, 10, 'Spare Parts', 'Service', ''),
(80, 0, 11, 'Service And Energy Business', 'Finance And Accounts', ''),
(81, 0, 11, 'Service And Energy Business', 'Service', ''),
(82, 0, 11, 'Service And Energy Business', 'Operation', ''),
(83, 0, 11, 'Service And Energy Business', 'Sales And Marketing', ''),
(84, 0, 11, 'Service And Energy Business', 'Administration', ''),
(85, 0, 11, 'Service And Energy Business', 'Pre Sales', ''),
(86, 0, 11, 'Service And Energy Business', 'Maintenance', ''),
(87, 0, 11, 'Service And Energy Business', 'Group Customer Care', ''),
(88, 0, 11, 'Service And Energy Business', 'Marine', ''),
(89, 0, 12, 'SPOT', 'Documentation', ''),
(90, 0, 12, 'SPOT', 'Billing', ''),
(91, 0, 12, 'SPOT', 'Operation', ''),
(92, 0, 12, 'SPOT', 'Administration', ''),
(93, 0, 12, 'SPOT', 'Store', ''),
(94, 0, 12, 'SPOT', 'Finance And Accounts', ''),
(95, 0, 12, 'SPOT', 'Purchase And Procurement', ''),
(96, 0, 12, 'SPOT', 'CTMS', ''),
(97, 0, 12, 'SPOT', 'SC', ''),
(98, 0, 12, 'SPOT', 'Ship Planning', ''),
(99, 0, 12, 'SPOT', 'Terminal Operation', ''),
(100, 0, 12, 'SPOT', 'RMG', ''),
(101, 0, 12, 'SPOT', 'RTG', ''),
(102, 0, 12, 'SPOT', 'Winch', ''),
(103, 0, 12, 'SPOT', 'CCT Yard', ''),
(104, 0, 12, 'SPOT', 'Strategic Planning And Terminal Operation', ''),
(105, 0, 12, 'SPOT', 'NCT Yard', ''),
(106, 0, 12, 'SPOT', 'CFS', ''),
(107, 0, 12, 'SPOT', 'FLT', ''),
(108, 0, 12, 'SPOT', 'Yard Planning And Documentation', ''),
(109, 0, 12, 'SPOT', 'CCT Lasher', ''),
(110, 0, 12, 'SPOT', 'ITV', ''),
(111, 0, 12, 'SPOT', 'QGC', ''),
(112, 0, 12, 'SPOT', 'Quay Yard Supervisor', ''),
(113, 0, 12, 'SPOT', 'Delivery', ''),
(114, 0, 12, 'SPOT', 'NCT Lasher', ''),
(115, 0, 13, 'CTED-Dhaka', 'Operation', ''),
(116, 0, 13, 'CTED-Dhaka', 'Service', ''),
(117, 0, 13, 'CTED-Dhaka', 'Maintenance', ''),
(118, 0, 13, 'CTED-Dhaka', 'Administration', ''),
(119, 0, 14, 'CTED-CTG', 'Maintenance', ''),
(120, 0, 14, 'CTED-CTG', 'QGC and RTG', ''),
(121, 0, 14, 'CTED-CTG', 'PM and FLT', ''),
(122, 0, 14, 'CTED-CTG', 'Purchase And Procurement', ''),
(123, 0, 14, 'CTED-CTG', 'Store', ''),
(124, 0, 14, 'CTED-CTG', 'Administration', ''),
(125, 0, 14, 'CTED-CTG', 'QGC Maintanence', ''),
(129, 19, 16, '', 'Hardware', 'HARD'),
(130, 19, 16, '', 'Software', ''),
(131, 19, 16, '', 'Management', '');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `name` varchar(650) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`) VALUES
(1, 'Executive'),
(2, 'Manager'),
(3, 'Senior Brand Promoter'),
(4, 'Video Editor'),
(5, 'Photographer'),
(6, 'Brand Promoter'),
(7, 'Graphic Designer'),
(8, 'Assistant Manager'),
(9, 'Driver'),
(10, 'Office Assistant'),
(11, '3D Modeler'),
(12, 'Senior Online Video Editor'),
(13, 'Senior Graphic Designer'),
(14, 'Officer'),
(15, 'Chief Executive Officer'),
(16, 'Deputy General Manager'),
(17, 'Senior Officer'),
(18, 'Project Manager'),
(19, 'Dredging Master'),
(20, 'Project Co-Ordinator'),
(21, 'General Manager'),
(22, 'Electrician'),
(23, 'Assistant Engine Driver'),
(24, 'Engine Driver'),
(25, 'Work Boat Master'),
(26, 'Crew'),
(27, 'Lever Man'),
(28, 'Head Cook'),
(29, 'Director'),
(30, 'Assistant General Manager'),
(31, 'Supervisor'),
(32, 'Senior Technician'),
(33, 'Peon'),
(34, 'Assistant Cook'),
(35, 'Assistant'),
(36, 'Engineer'),
(37, 'Surveyor'),
(38, 'Operator'),
(39, 'Site Engineer'),
(40, 'Site Supervisor'),
(41, 'Ship Supervisor'),
(42, 'Deputy Manager'),
(43, 'Mechanic'),
(44, 'Assistant Site Supervisor'),
(45, 'Technician'),
(46, 'Pipe Fitter'),
(47, 'Sukani'),
(48, 'WINCH Operator'),
(49, 'Excavator Operator'),
(50, 'Senior Electrician'),
(51, 'Loskor'),
(52, 'Welder'),
(53, 'Storeman'),
(54, 'Assistant Engine Mechanic'),
(55, 'Chief Operating Officer'),
(56, 'Assistant Site Engineer'),
(57, 'Lab Techinacian'),
(58, 'Assistant Hydraulic Mechanic'),
(59, 'Assistant Supervisor'),
(60, 'Assistant Engineer'),
(61, 'Site Assistant'),
(62, 'Admin Assistant'),
(63, 'Bulldozer Operator'),
(64, 'Work Boat Engine Driver'),
(65, 'Batching Plant Operator'),
(66, 'Project Engineer'),
(67, 'Deputy Project Manager'),
(68, 'Wheel Loader Operator'),
(69, 'Cook Helper'),
(70, 'Dump Truck Driver'),
(71, 'Mixer Truck Driver'),
(72, 'Prime Mover Driver'),
(73, 'Harbour Crane Operator'),
(74, 'Helper'),
(75, 'Batching Plant Helper'),
(76, 'Crane Operator'),
(77, 'Dozzer Operator'),
(78, 'Concrete Pump Operator'),
(79, 'Assistant Rigger'),
(80, 'Transit Mixer Helper'),
(81, 'Block Machine Operator'),
(82, 'Fork Lift Operator'),
(83, 'Plant Engineer'),
(84, 'Diesel Hammer Operator'),
(85, 'Concrete Pump Pipe Fitter'),
(86, 'Long Boom Excavator Operator'),
(87, 'Mixture Truck Helper'),
(88, 'Low Bed Helper'),
(89, 'Mechanical Helper'),
(90, 'Low Bed Operator'),
(91, 'Junior Fitter'),
(92, 'Site Mechanical Engineer'),
(93, 'Quantity Surveyor Engineer'),
(94, 'Roller Operator'),
(95, 'Backhoe Operator'),
(96, 'Tractor Driver'),
(97, 'Store Keeper'),
(98, 'Assistant Lab Technician'),
(99, 'Senior Project Manager'),
(100, 'Trainee Officer'),
(101, 'Rigger'),
(102, 'Plant Operator'),
(103, 'Junior Officer'),
(104, 'Independent Director'),
(105, 'Head of Project'),
(106, 'Senior Manager'),
(107, 'Foreman'),
(108, 'Logistic Support Officer'),
(109, 'Executive Director'),
(110, 'Service Technician'),
(111, 'Junior Technician'),
(112, 'Managing Director'),
(113, 'Chairman'),
(114, 'Additional Managing Director'),
(115, 'Chief Finance Officer'),
(116, 'Head of QMS'),
(117, 'Company Secretary'),
(118, 'Accounts Assistant'),
(119, 'Customer Care'),
(120, 'Body Guard'),
(121, 'Assistant Security Supervisor'),
(122, 'Security Guard'),
(123, 'Security Inspector'),
(124, 'Front Desk Officer'),
(125, 'Head of IT'),
(126, 'Canteen Boy'),
(127, 'Liason Officer'),
(128, 'Incharge Billing And Doc.'),
(129, 'Protocol Officer'),
(130, 'Junior Engineer'),
(131, 'Yard Checker'),
(132, 'Sales ADM And Application Engg.'),
(133, 'Head Technician'),
(134, 'Head of Finance And Accounts'),
(135, 'Terminal Superintendent'),
(136, 'Area Manager'),
(137, 'Share Officer'),
(138, 'Store Officer'),
(139, 'Security Supervisor'),
(140, 'Security Officer'),
(141, 'Painter'),
(142, 'RST Operator'),
(143, 'Assistant Yard Supervisor'),
(144, 'Trailer Operator'),
(145, 'Trainee Technician'),
(146, 'Welder Project'),
(147, 'Tyre Feeder'),
(148, 'Trainee Engineer'),
(149, 'Cleaner'),
(150, 'Caretaker'),
(151, 'Assistant Protocol Officer'),
(152, 'In-Charge'),
(153, 'Technical Helper'),
(154, 'Loader'),
(155, 'Advisor'),
(156, 'Consultant'),
(157, 'Estate Officer'),
(158, 'Assistant Officer'),
(159, 'Trainee Yard Checker'),
(160, 'Door Closer'),
(161, 'Yard Supervisor'),
(162, 'Lasher'),
(163, 'Additional Chief Engineer'),
(164, 'Senior Engineer'),
(165, 'Senior Mechanic'),
(166, 'Vulcanizer'),
(167, 'Semi Mechanic'),
(168, 'Lathe Man'),
(169, 'Head of CTMS'),
(170, 'Service Engineer'),
(171, 'SC Operator'),
(172, 'Senior Equipment Controller'),
(173, 'Co-Ordinator'),
(174, 'Assistant Equipment Co-Ordinator'),
(175, 'Documentation Staff Trainee'),
(176, 'Regional Manager'),
(177, 'Terminal Manager'),
(178, 'CFS Shed Incharge'),
(179, 'Photo copier'),
(180, 'Office Boy'),
(181, 'RTG SC Controller'),
(182, 'Assistant Welfare Officer'),
(183, 'Radio And HHT Keeper'),
(184, 'Documentation Staff'),
(185, 'RTG Checker'),
(186, 'Keep Down Checker'),
(187, 'Handover Clerk'),
(188, 'Tally Clerk'),
(189, 'ICD Checker'),
(190, 'Carpenter'),
(191, 'Jetty Sareng'),
(192, 'Mark Man'),
(193, 'Assistant Ship Planner'),
(194, 'Senior Assistant Ship Supervisor'),
(195, 'Tracer'),
(196, 'Assistant Ship Supervisor'),
(197, 'Deck And Crane Checker'),
(198, 'Checker'),
(199, 'Empty Area Checker'),
(200, 'RTG Operator'),
(201, 'Trainee Tracer'),
(202, 'FLT Operator'),
(203, 'Lasher Foreman'),
(204, 'ITV Operator'),
(205, 'ITV Supervisor'),
(206, 'QGC Operator'),
(207, 'Ship And Yard Planner'),
(208, 'Import And Export Permission Clerk'),
(209, 'Senior Yard Supervisor'),
(210, 'Assistant Yard Superintendent'),
(211, 'Senior Keep Down Checker'),
(212, 'Trainee RTG Operator'),
(213, 'Escort Officer'),
(214, 'Supervisor In-Charge'),
(215, 'Medical Assistant'),
(216, 'Labour In-Charge'),
(217, 'Delivery Supervisor'),
(218, 'Billing Assistant'),
(219, 'Labour Supervisor'),
(220, 'Assistant Terminal Suprintendent'),
(221, 'Assistant Billing Coordinator'),
(222, 'Application Engineer'),
(223, 'Marine Leader'),
(224, 'IT Assistant'),
(225, 'Head of Product and Service'),
(226, 'Web Designer'),
(227, 'Delivery Checker'),
(228, 'Chief Marketing Officer'),
(229, 'Assistant Mechanic'),
(230, 'Assistant Carpenter'),
(231, 'Operation Engineer'),
(232, 'Assistant Foreman'),
(233, 'Factory Manager'),
(234, 'Assistant Operator'),
(235, 'Store Assistant'),
(236, 'Junior Operator'),
(237, 'Quality Control Inspector');

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `id` int(11) NOT NULL,
  `equipment_id` varchar(10) NOT NULL,
  `equipment_no` varchar(25) NOT NULL,
  `type_id` varchar(15) NOT NULL,
  `project_id` varchar(15) NOT NULL,
  `created_at` date NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`id`, `equipment_id`, `equipment_no`, `type_id`, `project_id`, `created_at`, `status`) VALUES
(2, 'CTED-001', 'QGC-01', '46', '1', '0000-00-00', ''),
(3, 'CTED-002', 'QGC-02', '46', '1', '0000-00-00', ''),
(4, 'CTED-003', 'QGC-03', '46', '1', '0000-00-00', ''),
(5, 'CTED-004', 'QGC-04', '46', '1', '0000-00-00', ''),
(6, 'CTED-005', 'QGC-05', '46', '1', '0000-00-00', ''),
(7, 'CTED-006', 'QGC-06', '46', '1', '0000-00-00', ''),
(8, 'CTED-007', 'QGC-07', '46', '1', '0000-00-00', ''),
(9, 'CTED-008', 'QGC-08', '46', '1', '0000-00-00', ''),
(10, 'CTED-009', 'QGC-09', '46', '1', '0000-00-00', ''),
(11, 'CTED-010', 'QGC-10', '46', '1', '0000-00-00', ''),
(12, 'CTED-011', 'QGC-11', '46', '1', '0000-00-00', ''),
(13, 'CTED-012', 'QGC-12', '46', '1', '0000-00-00', ''),
(14, 'CTED-013', 'QGC-13', '46', '1', '0000-00-00', ''),
(15, 'CTED-014', 'QGC-14', '46', '1', '0000-00-00', ''),
(16, 'CTED-015', 'RTG-07', '47', '1', '0000-00-00', ''),
(17, 'CTED-016', 'RTG-08', '47', '1', '0000-00-00', ''),
(19, 'CTED-018', 'RTG-09', '47', '1', '0000-00-00', ''),
(20, 'CTED-019', 'RTG-10', '47', '1', '0000-00-00', ''),
(21, 'CTED-020', 'RTG-11', '47', '1', '0000-00-00', ''),
(22, 'CTED-021', 'RTG-12', '47', '1', '0000-00-00', ''),
(23, 'CTED-022', 'RTG-13', '47', '1', '0000-00-00', ''),
(24, 'CTED-023', 'RTG-14', '47', '1', '0000-00-00', ''),
(25, 'CTED-024', 'RTG-15', '47', '1', '0000-00-00', ''),
(27, 'CTED-026', 'RTG-16', '47', '1', '0000-00-00', ''),
(28, 'CTED-027', 'RTG-17', '47', '1', '0000-00-00', ''),
(29, 'CTED-028', 'RTG-18', '47', '1', '0000-00-00', ''),
(30, 'CTED-029', 'RTG-19', '47', '1', '0000-00-00', ''),
(31, 'CTED-030', 'RTG-20', '47', '1', '0000-00-00', ''),
(32, 'CTED-031', 'RTG-21', '47', '1', '0000-00-00', ''),
(33, 'CTED-032', 'RTG-22', '47', '1', '0000-00-00', ''),
(34, 'CTED-033', 'RTG-23', '47', '1', '0000-00-00', ''),
(36, 'CTED-035', 'RTG-24', '47', '1', '0000-00-00', ''),
(37, 'CTED-036', 'RTG-25', '47', '1', '0000-00-00', ''),
(38, 'CTED-037', 'RTG-26', '47', '1', '0000-00-00', ''),
(39, 'CTED-038', 'RTG-27', '47', '1', '0000-00-00', ''),
(40, 'CTED-039', 'RTG-28', '47', '1', '0000-00-00', ''),
(41, 'CTED-040', 'RTG-31', '47', '1', '0000-00-00', ''),
(42, 'CTED-041', 'RTG-32', '47', '1', '0000-00-00', ''),
(43, 'CTED-042', 'RTG-33', '47', '1', '0000-00-00', ''),
(44, 'CTED-043', 'RTG-34', '47', '1', '0000-00-00', ''),
(45, 'CTED-044', 'RTG-35', '47', '1', '0000-00-00', ''),
(46, 'CTED-045', 'RTG-36', '47', '1', '0000-00-00', ''),
(47, 'CTED-046', 'RTG-37', '47', '1', '0000-00-00', ''),
(48, 'CTED-047', 'RTG-38', '47', '1', '0000-00-00', ''),
(49, 'CTED-048', 'SP-08', '51', '1', '0000-00-00', '1'),
(50, 'CTED-049', 'SP-09', '51', '1', '0000-00-00', '1'),
(51, 'CTED-050', 'SP-10', '51', '1', '0000-00-00', '1'),
(52, 'CTED-051', 'SP-11', '51', '1', '0000-00-00', '1'),
(53, 'CTED-052', 'SP-12', '51', '1', '0000-00-00', '1'),
(54, 'CTED-053', 'SP-13', '51', '1', '0000-00-00', '1'),
(55, 'CTED-054', 'SP-14', '51', '1', '0000-00-00', '1'),
(56, 'CTED-055', 'SP-15', '51', '1', '0000-00-00', '1'),
(57, 'CTED-056', 'SP-16', '51', '1', '0000-00-00', '1'),
(58, 'CTED-057', 'SP-17', '51', '1', '0000-00-00', '1'),
(59, 'CTED-058', 'SP-19', '51', '1', '0000-00-00', '1'),
(60, 'CTED-059', 'SP-22', '51', '1', '0000-00-00', '1'),
(61, 'CTED-060', 'SP-23', '51', '1', '0000-00-00', '1'),
(62, 'CTED-061', 'SP-24', '51', '1', '0000-00-00', '1'),
(63, 'CTED-062', 'SP-25', '51', '1', '0000-00-00', '1'),
(64, 'CTED-063', 'SP-26', '51', '1', '0000-00-00', '1'),
(65, 'CTED-064', 'SP-27', '51', '1', '0000-00-00', '1'),
(66, 'CTED-065', 'SP-28', '51', '1', '0000-00-00', '1'),
(67, 'CTED-066', 'SP-30', '51', '1', '0000-00-00', '1'),
(68, 'CTED-067', 'SP-31', '51', '1', '0000-00-00', '1'),
(69, 'CTED-068', 'SP-32', '51', '1', '0000-00-00', '1'),
(70, 'CTED-069', 'SP-33', '51', '1', '0000-00-00', '1'),
(71, 'CTED-070', 'SP-35', '51', '1', '0000-00-00', '1'),
(72, 'CTED-071', 'SP-36', '51', '1', '0000-00-00', '1'),
(73, 'CTED-072', 'SP-37', '51', '1', '0000-00-00', '1'),
(74, 'CTED-073', 'SP-39', '51', '1', '0000-00-00', '1'),
(75, 'CTED-074', 'SP-40', '51', '1', '0000-00-00', '1'),
(76, 'CTED-075', 'SP-41', '51', '1', '0000-00-00', '1'),
(77, 'CTED-076', 'SP-42', '51', '1', '0000-00-00', '1'),
(78, 'CTED-077', 'SP-43', '51', '1', '0000-00-00', '1'),
(79, 'CTED-078', 'SP-44', '51', '1', '0000-00-00', '1'),
(80, 'CTED-079', 'SP-45', '51', '1', '0000-00-00', '1'),
(81, 'CTED-080', 'SP-46', '51', '1', '0000-00-00', '1'),
(82, 'CTED-081', 'SP-47', '51', '1', '0000-00-00', '1'),
(83, 'CTED-082', 'SP-48', '51', '1', '0000-00-00', '1'),
(84, 'CTED-083', 'SP-49', '51', '1', '0000-00-00', '1'),
(85, 'CTED-084', 'SP-50', '51', '1', '0000-00-00', '1'),
(86, 'CTED-085', 'SP-51', '51', '1', '0000-00-00', '1'),
(87, 'CTED-086', 'SP-52', '51', '1', '0000-00-00', '1'),
(88, 'CTED-087', 'SP-53', '51', '1', '0000-00-00', '1'),
(89, 'CTED-088', 'SP-54', '51', '1', '0000-00-00', '1'),
(90, 'CTED-089', 'SP-55', '51', '1', '0000-00-00', '1'),
(91, 'CTED-090', 'SP-56', '51', '1', '0000-00-00', '1'),
(92, 'CTED-091', 'SP-57', '51', '1', '0000-00-00', '1'),
(93, 'CTED-092', 'SP-58', '51', '1', '0000-00-00', '1'),
(94, 'CTED-093', 'SP-59', '51', '1', '0000-00-00', '1'),
(95, 'CTED-094', 'SP-60', '51', '1', '0000-00-00', '1'),
(96, 'CTED-095', 'SP-61', '51', '1', '0000-00-00', '1'),
(97, 'CTED-096', 'SP-62', '51', '1', '0000-00-00', '1'),
(98, 'CTED-097', 'SP-63', '51', '1', '0000-00-00', '1'),
(99, 'CTED-098', 'SP-64', '51', '1', '0000-00-00', '1'),
(100, 'CTED-099', 'SP-65', '51', '1', '0000-00-00', '1'),
(101, 'CTED-100', 'SP-66', '51', '1', '0000-00-00', '1'),
(102, 'CTED-101', 'SP-67', '51', '1', '0000-00-00', '1'),
(103, 'CTED-102', 'SP-68', '51', '1', '0000-00-00', '1'),
(104, 'CTED-103', 'SP-69', '51', '1', '0000-00-00', '1'),
(105, 'CTED-104', 'SP-70', '51', '1', '0000-00-00', '1'),
(106, 'CTED-105', 'SP-71', '51', '1', '0000-00-00', '1'),
(107, 'CTED-106', 'SP-72', '51', '1', '0000-00-00', '1'),
(108, 'CTED-107', 'SP-73', '51', '1', '0000-00-00', '1'),
(109, 'CTED-108', 'SP-74', '51', '1', '0000-00-00', '1'),
(110, 'CTED-109', 'SP-75', '51', '1', '0000-00-00', '1'),
(111, 'CTED-110', 'SP-76', '51', '1', '0000-00-00', '1'),
(112, 'CTED-111', 'SP-77', '51', '1', '0000-00-00', '1'),
(113, 'CTED-112', 'SP-78', '51', '1', '0000-00-00', '1'),
(114, 'CTED-113', 'SP-79', '51', '1', '0000-00-00', '1'),
(115, 'CTED-114', 'SP-80', '51', '1', '0000-00-00', '1'),
(116, 'CTED-115', 'SP-81', '51', '1', '0000-00-00', '1'),
(117, 'CTED-116', 'SP-82', '51', '1', '0000-00-00', '1'),
(118, 'CTED-117', 'SP-83', '51', '1', '0000-00-00', '1'),
(119, 'CTED-118', 'SP-84', '51', '1', '0000-00-00', '1'),
(120, 'CTED-119', 'SP-85', '51', '1', '0000-00-00', '1'),
(121, 'CTED-120', 'SP-86', '51', '1', '0000-00-00', '1'),
(122, 'CTED-121', 'SP-87', '51', '1', '0000-00-00', '1'),
(123, 'CTED-122', 'SP-88', '51', '1', '0000-00-00', '1'),
(124, 'CTED-123', 'SP-89', '51', '1', '0000-00-00', '1'),
(125, 'CTED-124', 'SP-90', '51', '1', '0000-00-00', '1'),
(126, 'CTED-125', 'SP-91', '51', '1', '0000-00-00', '1'),
(127, 'CTED-126', 'SP-92', '51', '1', '0000-00-00', '1'),
(128, 'CTED-127', 'SP-93', '51', '1', '0000-00-00', '1'),
(129, 'CTED-128', 'SP-94', '51', '1', '0000-00-00', '1'),
(130, 'CTED-129', 'SP-95', '51', '1', '0000-00-00', '1'),
(131, 'CTED-130', 'SP-96', '51', '1', '0000-00-00', '1'),
(132, 'CTED-131', 'SP-97', '51', '1', '0000-00-00', '1'),
(133, 'CTED-132', 'SP-98', '51', '1', '0000-00-00', '1'),
(134, 'CTED-133', 'SP-99', '51', '1', '0000-00-00', '1'),
(135, 'CTED-134', 'SP-100', '51', '1', '0000-00-00', '1'),
(136, 'CTED-135', 'SP-101', '51', '1', '0000-00-00', '1'),
(137, 'CTED-136', 'SP-102', '51', '1', '0000-00-00', '1'),
(138, 'CTED-137', 'SP-103', '51', '1', '0000-00-00', '1'),
(139, 'CTED-138', 'SP-104', '51', '1', '0000-00-00', '1'),
(140, 'CTED-139', 'SP-139', '51', '1', '0000-00-00', '1'),
(141, 'CTED-140', 'FLT-04', '49', '1', '0000-00-00', '1'),
(142, 'CTED-141', 'FLT-06', '49', '1', '0000-00-00', '1'),
(143, 'CTED-142', 'FLT-07', '49', '1', '0000-00-00', '1'),
(144, 'CTED-143', 'FLT-08', '49', '1', '0000-00-00', '1'),
(145, 'CTED-144', 'FLT-11', '49', '1', '0000-00-00', '1'),
(146, 'CTED-145', 'FLT-12', '49', '1', '0000-00-00', '1'),
(147, 'CTED-146', 'FLT-13', '49', '1', '0000-00-00', '1'),
(148, 'CTED-147', 'FLT-15', '49', '1', '0000-00-00', '1'),
(149, 'CTED-148', 'RST-17', '48', '1', '0000-00-00', '1'),
(150, 'CTED-149', 'FLT-18', '49', '1', '0000-00-00', '1'),
(151, 'CTED-150', 'FLT-19', '49', '1', '0000-00-00', '1'),
(152, 'CTED-151', 'FLT-20', '49', '1', '0000-00-00', '1'),
(153, 'CTED-152', 'FLT-21', '49', '1', '0000-00-00', '1'),
(154, 'CTED-153', 'FLT-22', '49', '1', '0000-00-00', '1'),
(155, 'CTED-154', 'FLT-23', '49', '1', '0000-00-00', '1'),
(156, 'CTED-155', 'FLT-24', '49', '1', '0000-00-00', '1'),
(157, 'CTED-156', 'FLT-25', '49', '1', '0000-00-00', '1'),
(158, 'CTED-157', 'FLT-26', '49', '1', '0000-00-00', '1'),
(159, 'CTED-158', 'FLT-27', '49', '1', '0000-00-00', '1'),
(160, 'CTED-159', 'RST-28', '48', '1', '0000-00-00', '1'),
(161, 'CTED-160', 'SP-105', '51', '1', '0000-00-00', '1'),
(162, 'CTED-161', 'SP-106', '51', '1', '0000-00-00', '1'),
(163, 'CTED-162', 'SP-107', '51', '1', '0000-00-00', '1'),
(164, 'CTED-163', 'SP-108', '51', '1', '0000-00-00', '1'),
(165, 'CTED-164', 'SP-109', '51', '1', '0000-00-00', '1'),
(166, 'CTED-165', 'SP-110', '51', '1', '0000-00-00', '1'),
(167, 'CTED-166', 'SP-111', '51', '1', '0000-00-00', '1'),
(168, 'CTED-167', 'SP-112', '51', '1', '0000-00-00', '1'),
(169, 'CTED-168', 'SP-113', '51', '1', '0000-00-00', '1'),
(170, 'CTED-169', 'SP-114', '51', '1', '0000-00-00', '1'),
(171, 'CTED-170', 'SP-115', '51', '1', '0000-00-00', '1'),
(172, 'CTED-171', 'SP-116', '51', '1', '0000-00-00', '1'),
(173, 'CTED-172', 'SP-117', '51', '1', '0000-00-00', '1'),
(174, 'CTED-173', 'SP-118', '51', '1', '0000-00-00', '1'),
(175, 'CTED-174', 'SP-119', '51', '1', '0000-00-00', '1'),
(176, 'CTED-175', 'SP-120', '51', '1', '0000-00-00', '1'),
(177, 'CTED-176', 'SP-121', '51', '1', '0000-00-00', '1'),
(178, 'CTED-177', 'SP-122', '51', '1', '0000-00-00', '1'),
(179, 'CTED-178', 'SP-123', '51', '1', '0000-00-00', '1'),
(180, 'CTED-179', 'SP-124', '51', '1', '0000-00-00', '1'),
(181, 'CTED-180', 'SP-125', '51', '1', '0000-00-00', '1'),
(182, 'CTED-181', 'SP-126', '51', '1', '0000-00-00', '1'),
(183, 'CTED-182', 'SP-127', '51', '1', '0000-00-00', '1'),
(184, 'CTED-183', 'SP-128', '51', '1', '0000-00-00', '1'),
(185, 'CTED-184', 'SP-129', '51', '1', '0000-00-00', '1'),
(186, 'CTED-185', 'SP-130', '51', '1', '0000-00-00', '1'),
(187, 'CTED-186', 'SP-131', '51', '1', '0000-00-00', '1'),
(188, 'CTED-187', 'SP-132', '51', '1', '0000-00-00', '1'),
(189, 'CTED-188', 'SP-133', '51', '1', '0000-00-00', '1'),
(190, 'CTED-189', 'SP-134', '51', '1', '0000-00-00', '1'),
(191, 'CTED-190', 'SP-135', '51', '1', '0000-00-00', '1'),
(192, 'CTED-191', 'SP-136', '51', '1', '0000-00-00', '1'),
(193, 'CTED-192', 'SP-137', '51', '1', '0000-00-00', '1'),
(194, 'CTED-193', 'SP-138', '51', '1', '0000-00-00', '1'),
(201, 'CTED-197', 'SP-01', '51', '1', '0000-00-00', ''),
(202, 'CTED-198', 'SP-02', '51', '1', '0000-00-00', ''),
(203, 'CTED-199', 'SP-20', '51', '1', '0000-00-00', ''),
(204, 'CTED-200', 'SP-21', '51', '1', '0000-00-00', ''),
(205, 'CTED-201', 'MHC-01', '50', '1', '0000-00-00', ''),
(206, 'CTED-202', 'MHC-04', '50', '1', '0000-00-00', ''),
(207, 'CTED-203', 'MHC-05', '50', '1', '0000-00-00', ''),
(208, 'CTED-204', 'SC-161', '56', '1', '0000-00-00', ''),
(209, 'CTED-205', 'SC-162', '56', '1', '0000-00-00', ''),
(210, 'CTED-206', 'SC-163', '56', '1', '0000-00-00', ''),
(211, 'CTED-201', 'TS-01', '58', '1', '0000-00-00', ''),
(212, 'CTED-202', 'TS-02', '58', '1', '0000-00-00', ''),
(213, 'CTED-203', 'TS-03', '58', '1', '0000-00-00', ''),
(214, 'CTED-204', 'TS-04', '58', '1', '0000-00-00', ''),
(215, 'CTED-205', 'TS-05', '58', '1', '0000-00-00', ''),
(216, 'CTED-206', 'TS-06', '58', '1', '0000-00-00', ''),
(217, 'CTED-207', 'RST-29', '48', '1', '0000-00-00', ''),
(218, 'CTED-208', 'CH-01', '51', '1', '0000-00-00', ''),
(219, 'CTED-209', 'CH-02', '51', '1', '0000-00-00', ''),
(220, 'CTED-210', 'CH-03', '51', '1', '0000-00-00', ''),
(221, 'CTED-211', 'CH-04', '51', '1', '0000-00-00', ''),
(222, 'CTED-212', 'CH-05', '51', '1', '0000-00-00', ''),
(223, 'CTED-213', 'CH-06', '51', '1', '0000-00-00', ''),
(224, 'CTED-214', 'CH-07', '51', '1', '0000-00-00', ''),
(225, 'CTED-215', 'CH-08', '51', '1', '0000-00-00', ''),
(226, 'CTED-216', 'CH-07', '51', '1', '0000-00-00', ''),
(227, 'CTED-217', 'CH-06', '51', '1', '0000-00-00', ''),
(228, 'CTED-218', 'CH-09', '51', '1', '0000-00-00', ''),
(229, 'CTED-219', 'CH-42', '51', '1', '0000-00-00', ''),
(230, 'CTED-220', 'CH-56', '51', '1', '0000-00-00', ''),
(231, 'CTED-221', 'RTG-42', '47', '1', '0000-00-00', ''),
(232, 'CTED-222', 'RTG-43', '47', '1', '0000-00-00', ''),
(233, 'CTED-223', 'RTG-44', '47', '1', '0000-00-00', ''),
(234, 'CTED-224', 'QGC-15', '46', '1', '0000-00-00', ''),
(235, 'CTED-225', 'QGC-16', '46', '1', '0000-00-00', ''),
(236, 'CTED-226', 'RTG-45', '47', '1', '0000-00-00', ''),
(237, 'CTED-227', 'RTG-46', '47', '1', '0000-00-00', ''),
(238, 'CTED-228', 'RTG-47', '47', '1', '0000-00-00', ''),
(239, 'CTED-229', 'QGC-17', '46', '1', '0000-00-00', ''),
(240, 'CTED-230', 'QGC-18', '46', '1', '0000-00-00', ''),
(241, 'CTED-231', 'TS 07', '59', '1', '0000-00-00', ''),
(242, 'CTED-232', 'TS 08', '59', '1', '0000-00-00', ''),
(243, 'CTED-233', 'TS 09', '59', '1', '0000-00-00', ''),
(244, 'CTED-234', 'TS 10', '59', '1', '0000-00-00', ''),
(245, 'CTED-235', 'TS 11', '59', '1', '0000-00-00', ''),
(246, 'CTED-236', 'TS 12', '59', '1', '0000-00-00', ''),
(247, 'CTED-237', 'TS 13', '59', '1', '0000-00-00', ''),
(248, 'CTED-238', 'TS 14', '59', '1', '0000-00-00', ''),
(249, 'CTED-239', 'TS 15', '59', '1', '0000-00-00', ''),
(250, 'CTED-240', 'TS 16', '59', '1', '0000-00-00', ''),
(251, 'CTED-241', 'TS 17', '59', '1', '0000-00-00', ''),
(252, 'CTED-242', 'TS 18', '59', '1', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `entity_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `class` varchar(191) DEFAULT NULL,
  `text` varchar(191) NOT NULL,
  `assets` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_types`
--

CREATE TABLE `history_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_challan`
--

CREATE TABLE `inv_challan` (
  `id` int(11) NOT NULL,
  `challan_no` varchar(100) NOT NULL,
  `challan_date` varchar(100) NOT NULL,
  `csn` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_complain`
--

CREATE TABLE `inv_complain` (
  `id` int(11) NOT NULL,
  `complain_id` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `vehicle_reg_no` varchar(100) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `chasis_no` varchar(100) NOT NULL,
  `brand_model` varchar(100) NOT NULL,
  `engine_no` varchar(100) NOT NULL,
  `owner_phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `driver_phone` varchar(100) NOT NULL,
  `milege` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_complaindetails`
--

CREATE TABLE `inv_complaindetails` (
  `id` int(11) NOT NULL,
  `complain_id` varchar(100) NOT NULL,
  `complain_details` varchar(5000) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_designation`
--

CREATE TABLE `inv_designation` (
  `id` int(11) NOT NULL,
  `des_id` varchar(100) NOT NULL,
  `designation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_employee`
--

CREATE TABLE `inv_employee` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `division` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `join_date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `sex` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_ga_listunit`
--

CREATE TABLE `inv_ga_listunit` (
  `id` int(11) NOT NULL,
  `lunit_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lunit_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice`
--

CREATE TABLE `inv_invoice` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `invoice_date` varchar(100) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `total_qty` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `total_service` varchar(100) NOT NULL,
  `grand_total` varchar(100) NOT NULL,
  `debit` varchar(100) NOT NULL,
  `credit` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_invoice_details`
--

CREATE TABLE `inv_invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `material_id` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `unit_price` varchar(100) NOT NULL,
  `part_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_issue`
--

CREATE TABLE `inv_issue` (
  `id` int(11) NOT NULL,
  `issue_id` varchar(25) NOT NULL,
  `issue_date` date NOT NULL,
  `received_by` varchar(100) NOT NULL,
  `receiver_phone` varchar(100) NOT NULL,
  `use_in` varchar(30) NOT NULL,
  `no_of_material` int(11) NOT NULL,
  `total_amount` float NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `issued_by` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` varchar(100) NOT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approval_remarks` longtext NOT NULL,
  `issue_image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_issue`
--

INSERT INTO `inv_issue` (`id`, `issue_id`, `issue_date`, `received_by`, `receiver_phone`, `use_in`, `no_of_material`, `total_amount`, `remarks`, `project_id`, `warehouse_id`, `issued_by`, `approval_status`, `approved_by`, `approved_at`, `approval_remarks`, `issue_image`) VALUES
(1, 'IS-CW-001', '2023-09-05', '', '', 'CH-01', 0, 15500, 'Okay', '1', '1', '1', 0, '', NULL, '', ''),
(2, 'IS-CW-002', '2023-09-05', '', '', 'FLT-04', 0, 15500, 'Okay', '1', '1', '1', 0, '', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `inv_issuedetail`
--

CREATE TABLE `inv_issuedetail` (
  `id` int(11) NOT NULL,
  `issue_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `issue_date` date NOT NULL,
  `material_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `issue_qty` float NOT NULL,
  `issue_price` float NOT NULL,
  `part_no` varchar(200) NOT NULL,
  `use_in` varchar(50) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_issuedetail`
--

INSERT INTO `inv_issuedetail` (`id`, `issue_id`, `issue_date`, `material_id`, `material_name`, `unit`, `issue_qty`, `issue_price`, `part_no`, `use_in`, `project_id`, `warehouse_id`, `package_id`, `building_id`, `approval_status`, `is_manual_code_edit`) VALUES
(1, 'IS-CW-001', '2023-09-05', '02-01', '1', '20', 1, 4500, '920871.0163', 'CH-01', '1', '1', '', '', 0, 0),
(2, 'IS-CW-001', '2023-09-05', '02-02', '2', '20', 2, 5500, '923829.1401', 'CH-01', '1', '1', '', '', 0, 0),
(3, 'IS-CW-002', '2023-09-05', '02-01', '1', '20', 1, 4500, '920871.0163', 'FLT-04', '1', '1', '', '', 0, 0),
(4, 'IS-CW-002', '2023-09-05', '02-02', '2', '20', 2, 5500, '923829.1401', 'FLT-04', '1', '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_item_unit`
--

CREATE TABLE `inv_item_unit` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_item_unit`
--

INSERT INTO `inv_item_unit` (`id`, `unit_name`) VALUES
(20, 'Pcs'),
(21, 'Ltr'),
(22, 'Kg'),
(23, 'Sets'),
(27, 'Set'),
(28, 'Coil'),
(29, 'Meters'),
(30, 'Feet');

-- --------------------------------------------------------

--
-- Table structure for table `inv_job_card`
--

CREATE TABLE `inv_job_card` (
  `id` int(11) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `complain_id` varchar(100) NOT NULL,
  `milege` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `inv_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_job_card_details`
--

CREATE TABLE `inv_job_card_details` (
  `id` int(11) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `task_details` varchar(100) NOT NULL,
  `assign_to` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_material`
--

CREATE TABLE `inv_material` (
  `id` int(11) NOT NULL,
  `material_id_code` varchar(100) DEFAULT NULL,
  `material_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_sub_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `material_level3_id` int(11) DEFAULT NULL,
  `material_level4_id` int(11) DEFAULT NULL,
  `material_description` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `spec` varchar(100) NOT NULL,
  `location` varchar(30) NOT NULL,
  `type` varchar(100) NOT NULL,
  `material_min_stock` int(11) DEFAULT NULL,
  `avg_con_sump` int(11) DEFAULT NULL,
  `lead_time` int(11) DEFAULT NULL,
  `re_order_level` int(11) NOT NULL,
  `qty_unit` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `op_balance_qty` int(11) NOT NULL,
  `op_balance_val` int(11) NOT NULL,
  `chk_print` int(11) DEFAULT NULL,
  `cur_qty` int(11) DEFAULT NULL,
  `cur_price` int(11) DEFAULT NULL,
  `cur_value` int(11) DEFAULT NULL,
  `last_issue` date DEFAULT NULL,
  `last_receive` date DEFAULT NULL,
  `part_no` varchar(100) NOT NULL,
  `current_balance` float NOT NULL,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_material`
--

INSERT INTO `inv_material` (`id`, `material_id_code`, `material_id`, `material_sub_id`, `material_level3_id`, `material_level4_id`, `material_description`, `spec`, `location`, `type`, `material_min_stock`, `avg_con_sump`, `lead_time`, `re_order_level`, `qty_unit`, `op_balance_qty`, `op_balance_val`, `chk_print`, `cur_qty`, `cur_price`, `cur_value`, `last_issue`, `last_receive`, `part_no`, `current_balance`, `is_manual_code_edit`) VALUES
(1, '02-01', '2', '0', 0, 0, 'ENGINE', '-', '', '', 1, NULL, NULL, 0, '20', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '920871.0163', 8, 0),
(2, '02-02', '2', '0', 0, 0, 'FILTER HOUSING', '-', '-', '', 1, NULL, NULL, 0, '20', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '923829.1401', 16, 0),
(3, '01-01', '1', '0', 0, 0, 'xcv', 'xcv', '', '', 3, NULL, NULL, 0, '30', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'xcv', 0, 0),
(4, '03-01', '14', '0', 0, 0, 'sfsd', 'sdfs', 'sdfs', '', 3, NULL, NULL, 0, '30', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'sdfds', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_materialbalance`
--

CREATE TABLE `inv_materialbalance` (
  `id` int(11) NOT NULL,
  `mb_ref_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_materialid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_date` date NOT NULL,
  `mbin_qty` float NOT NULL,
  `mbin_val` float NOT NULL,
  `mbout_qty` float NOT NULL,
  `mbout_val` float NOT NULL,
  `mbprice` float NOT NULL,
  `mbtype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbserial` float NOT NULL,
  `mbserial_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbunit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jvno` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update	'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_materialbalance`
--

INSERT INTO `inv_materialbalance` (`id`, `mb_ref_id`, `mb_materialid`, `mb_date`, `mbin_qty`, `mbin_val`, `mbout_qty`, `mbout_val`, `mbprice`, `mbtype`, `mbserial`, `mbserial_id`, `mbunit_id`, `jvno`, `part_no`, `project_id`, `warehouse_id`, `package_id`, `building_id`, `approval_status`, `is_manual_code_edit`) VALUES
(1, 'MRR-0001', '02-01', '2023-09-05', 10, 45000, 0, 0, 4500, 'Receive', 1.1, '1', '20', 'MRR-0001', '920871.0163', '1', '1', '', '', 0, 0),
(2, 'MRR-0001', '02-02', '2023-09-05', 20, 110000, 0, 0, 5500, 'Receive', 1.1, '1', '20', 'MRR-0001', '923829.1401', '1', '1', '', '', 0, 0),
(3, 'IS-CW-001', '02-01', '2023-09-05', 0, 0, 1, 4500, 4500, 'Issue', 1.1, '1', '20', 'IS-CW-001', '920871.0163', '1', '1', '', '', 0, 0),
(4, 'IS-CW-001', '02-02', '2023-09-05', 0, 0, 2, 11000, 5500, 'Issue', 1.1, '1', '20', 'IS-CW-001', '923829.1401', '1', '1', '', '', 0, 0),
(5, 'IS-CW-002', '02-01', '2023-09-05', 0, 0, 1, 4500, 4500, 'Issue', 1.1, '1', '20', 'IS-CW-002', '920871.0163', '1', '1', '', '', 0, 0),
(6, 'IS-CW-002', '02-02', '2023-09-05', 0, 0, 2, 11000, 5500, 'Issue', 1.1, '1', '20', 'IS-CW-002', '923829.1401', '1', '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_materialcategory`
--

CREATE TABLE `inv_materialcategory` (
  `id` int(11) NOT NULL,
  `material_sub_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_sub_description` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_materialcategorysub`
--

CREATE TABLE `inv_materialcategorysub` (
  `id` int(11) NOT NULL,
  `category_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `_order` float NOT NULL,
  `category_description` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stock_acct_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chk_sbalance` int(11) DEFAULT NULL,
  `consumption_ac` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `same_level` tinyint(4) NOT NULL,
  `has_child` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_materialcategorysub`
--

INSERT INTO `inv_materialcategorysub` (`id`, `category_id`, `parent_id`, `_order`, `category_description`, `stock_acct_id`, `chk_sbalance`, `consumption_ac`, `same_level`, `has_child`) VALUES
(1, '01-00', 0, 1, 'RST', NULL, NULL, NULL, 0, 1),
(2, '02-00', 1, 2, 'KALMAR', NULL, NULL, NULL, 0, 1),
(3, '03-00', 1, 3, 'LIEBHERR', NULL, NULL, NULL, 0, 1),
(19, '04-00', 3, 4, 'rtr', NULL, NULL, NULL, 0, 0),
(20, '05-00', 0, 6, 'ghjgg', NULL, NULL, NULL, 0, 0),
(21, '06-00', 0, 7, 'dfsdfsd', NULL, NULL, NULL, 0, 1),
(22, '07-00', 0, 8, 'hjhj', NULL, NULL, NULL, 0, 0),
(23, '08-00', 21, 0, 'okokok', NULL, NULL, NULL, 0, 0),
(24, '09-00', 0, 5, 'fgfg', NULL, NULL, NULL, 0, 0),
(25, '10-00', 0, 5, 'sfgf', NULL, NULL, NULL, 0, 0),
(26, '11-00', 2, 6, 'fgfg', NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_material_level3`
--

CREATE TABLE `inv_material_level3` (
  `id` int(11) NOT NULL,
  `material_level3_code` varchar(15) NOT NULL,
  `category_id` varchar(15) NOT NULL,
  `category_sub_id` varchar(15) NOT NULL,
  `material_level3_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_material_level4`
--

CREATE TABLE `inv_material_level4` (
  `id` int(11) NOT NULL,
  `material_level4_code` varchar(15) NOT NULL,
  `category_id` varchar(15) NOT NULL,
  `category_sub_id` varchar(15) NOT NULL,
  `level3_id` varchar(15) NOT NULL,
  `material_level4_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_material_partno_detail`
--

CREATE TABLE `inv_material_partno_detail` (
  `id` int(11) NOT NULL,
  `inv_material_id` int(11) DEFAULT NULL,
  `material_id_code` varchar(255) DEFAULT NULL,
  `part_no` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inv_material_partno_detail`
--

INSERT INTO `inv_material_partno_detail` (`id`, `inv_material_id`, `material_id_code`, `part_no`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, '01-01', 'vbn', 1, 1, 1, '2023-09-05 00:00:00', '2023-09-05 00:00:00'),
(2, 1, '02-01', '920871.0163', 1, 1, 1, '2023-09-05 00:00:00', '2023-09-05 00:00:00'),
(3, 2, '02-02', '923829.1401', 1, 1, 1, '2023-09-05 00:00:00', '2023-09-05 00:00:00'),
(4, 3, '01-01', 'xcv', 1, 1, 1, '2023-09-05 00:00:00', '2023-09-05 00:00:00'),
(5, 4, '03-01', 'sdfds', 1, 1, 1, '2023-09-05 00:00:00', '2023-09-05 00:00:00'),
(6, 0, '02-01', '920871.0163', 1, 1, 1, '2023-09-07 00:00:00', '2023-09-07 00:00:00'),
(7, 0, '02-01', '920871.0163', 1, 1, 1, '2023-09-19 00:00:00', '2023-09-19 00:00:00'),
(8, 0, '02-01', '920871.0163', 1, 1, 1, '2023-09-19 00:00:00', '2023-09-19 00:00:00'),
(9, 0, '02-01', '920871.0163', 1, 1, 1, '2023-09-19 00:00:00', '2023-09-19 00:00:00'),
(10, 0, '02-01', '920871.0163', 1, 1, 1, '2023-09-19 00:00:00', '2023-09-19 00:00:00'),
(11, 0, '02-01', '920871.0163', 1, 1, 1, '2023-09-19 00:00:00', '2023-09-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `inv_particulars`
--

CREATE TABLE `inv_particulars` (
  `id` int(11) NOT NULL,
  `particulars_id` varchar(100) NOT NULL,
  `type_id` varchar(100) NOT NULL,
  `particulars` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_particulars_type`
--

CREATE TABLE `inv_particulars_type` (
  `id` int(11) NOT NULL,
  `type_id` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_product_price`
--

CREATE TABLE `inv_product_price` (
  `id` int(11) NOT NULL,
  `mrr_no` varchar(20) NOT NULL,
  `material_id` varchar(20) NOT NULL,
  `receive_details_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `part_no` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `cerated_by` varchar(15) NOT NULL,
  `updated_at` date NOT NULL,
  `updated_by` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inv_product_price`
--

INSERT INTO `inv_product_price` (`id`, `mrr_no`, `material_id`, `receive_details_id`, `qty`, `price`, `part_no`, `status`, `created_at`, `cerated_by`, `updated_at`, `updated_by`) VALUES
(1, 'MRR-0001', '02-01', 1, 8, 4500, '920871.0163', 1, '2023-09-05', '', '0000-00-00', ''),
(2, 'MRR-0001', '02-02', 2, 16, 5500, '923829.1401', 1, '2023-09-05', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `inv_purchase`
--

CREATE TABLE `inv_purchase` (
  `id` int(11) NOT NULL,
  `purchase_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `purchase_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_acct_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supplier_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postedtogl` int(11) DEFAULT NULL,
  `remarks` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `purchase_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `purchase_ware_hosue_id` int(11) DEFAULT NULL,
  `purchase_unit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chk_year_end` int(11) DEFAULT NULL,
  `receive_total` float DEFAULT NULL,
  `no_of_material` float DEFAULT NULL,
  `challanno` varchar(500) DEFAULT NULL,
  `jv_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `requisitionno` varchar(500) DEFAULT NULL,
  `requisition_date` datetime DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_purchasedetail`
--

CREATE TABLE `inv_purchasedetail` (
  `id` int(11) NOT NULL,
  `purchase_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `purchase_qty` float NOT NULL,
  `unit_price` float NOT NULL,
  `sl_no` int(11) NOT NULL,
  `total_purchase` float NOT NULL,
  `rd_serial_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_receive`
--

CREATE TABLE `inv_receive` (
  `id` int(11) NOT NULL,
  `mrr_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mrr_date` date DEFAULT NULL,
  `purchase_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_acct_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supplier_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postedtogl` int(11) DEFAULT NULL,
  `vat_challan_no` varchar(100) NOT NULL,
  `remarks` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receive_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) DEFAULT NULL,
  `receive_unit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chk_year_end` int(11) DEFAULT NULL,
  `receive_total` float DEFAULT NULL,
  `no_of_material` float DEFAULT NULL,
  `challanno` varchar(500) DEFAULT NULL,
  `challan_date` date NOT NULL,
  `jv_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `requisitionno` varchar(500) DEFAULT NULL,
  `requisition_date` datetime DEFAULT NULL,
  `received_by` varchar(100) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` varchar(100) NOT NULL,
  `approved_at` datetime DEFAULT NULL,
  `approval_remarks` longtext NOT NULL,
  `mrr_image` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_receive`
--

INSERT INTO `inv_receive` (`id`, `mrr_no`, `mrr_date`, `purchase_id`, `receive_acct_id`, `supplier_id`, `postedtogl`, `vat_challan_no`, `remarks`, `receive_type`, `project_id`, `warehouse_id`, `receive_unit_id`, `chk_year_end`, `receive_total`, `no_of_material`, `challanno`, `challan_date`, `jv_no`, `part_no`, `requisitionno`, `requisition_date`, `received_by`, `approval_status`, `approved_by`, `approved_at`, `approval_remarks`, `mrr_image`) VALUES
(1, 'MRR-0001', '2023-09-05', 'PR-0001', '6-14-010', 'SID-001', 0, '', 'Okay', 'Credit', '1', '1', '1', NULL, 155000, 30, 'CH-0001', '2023-09-05', NULL, '923829.1401', 'RLP-0001', '2023-09-05 00:00:00', '1', 0, '', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `inv_receivedetail`
--

CREATE TABLE `inv_receivedetail` (
  `id` int(11) NOT NULL,
  `mrr_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `receive_qty` float NOT NULL,
  `unit_price` float NOT NULL,
  `sl_no` int(11) NOT NULL,
  `total_receive` float NOT NULL,
  `rd_serial_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(1000) NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_manual_code_edit` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'for checking manual code update'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_receivedetail`
--

INSERT INTO `inv_receivedetail` (`id`, `mrr_no`, `material_id`, `material_name`, `unit_id`, `receive_qty`, `unit_price`, `sl_no`, `total_receive`, `rd_serial_id`, `part_no`, `project_id`, `warehouse_id`, `approval_status`, `is_manual_code_edit`) VALUES
(1, 'MRR-0001', '02-01', '1', 20, 10, 4500, 1, 45000, '', '920871.0163', '1', '1', 0, 0),
(2, 'MRR-0001', '02-02', '2', 20, 20, 5500, 1, 110000, '', '923829.1401', '1', '1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_requisition`
--

CREATE TABLE `inv_requisition` (
  `id` int(11) NOT NULL,
  `requisition_id` varchar(25) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `requisition_date` datetime NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `no_of_material` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_requisition_details`
--

CREATE TABLE `inv_requisition_details` (
  `id` int(11) NOT NULL,
  `requisition_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requisition_qty` float NOT NULL,
  `sl_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_return`
--

CREATE TABLE `inv_return` (
  `id` int(11) NOT NULL,
  `return_id` varchar(25) NOT NULL,
  `return_date` date NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `approval_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_returndetail`
--

CREATE TABLE `inv_returndetail` (
  `id` int(11) NOT NULL,
  `return_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `return_date` date NOT NULL,
  `material_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `return_qty` float NOT NULL,
  `return_price` float NOT NULL,
  `part_no` varchar(200) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_serviceinvoice`
--

CREATE TABLE `inv_serviceinvoice` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `service_name` varchar(2000) NOT NULL,
  `amount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_supplier`
--

CREATE TABLE `inv_supplier` (
  `id` int(11) NOT NULL,
  `supplier_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_company` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_person` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sposition` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_op_balance` float NOT NULL,
  `supplier_type` varchar(100) NOT NULL,
  `material_type` varchar(100) NOT NULL,
  `cc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_supplierbalance`
--

CREATE TABLE `inv_supplierbalance` (
  `id` int(11) NOT NULL,
  `sb_ref_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `sb_date` date NOT NULL,
  `sb_supplier_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sb_dr_amount` float NOT NULL,
  `sb_cr_amount` float NOT NULL,
  `sb_remark` varchar(175) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sb_partac_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_supplierbalance`
--

INSERT INTO `inv_supplierbalance` (`id`, `sb_ref_id`, `warehouse_id`, `sb_date`, `sb_supplier_id`, `sb_dr_amount`, `sb_cr_amount`, `sb_remark`, `sb_partac_id`, `approval_status`) VALUES
(1, 'MRR-0001', '1', '2023-09-05', 'SID-001', 0, 155000, 'Okay', 'MRR-0001', 0);

-- --------------------------------------------------------

--
-- Table structure for table `inv_technicianinfo`
--

CREATE TABLE `inv_technicianinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `department` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `address` varchar(5000) NOT NULL,
  `district` varchar(100) NOT NULL,
  `postcode` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `emg_contact` varchar(100) NOT NULL,
  `emg_rel` varchar(100) NOT NULL,
  `emg_tel` varchar(100) NOT NULL,
  `emg_mob` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_tranferdetail`
--

CREATE TABLE `inv_tranferdetail` (
  `id` int(11) NOT NULL,
  `transfer_id` varchar(100) NOT NULL,
  `material_id` varchar(100) NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `transfer_qty` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `inwarehouse` varchar(100) NOT NULL,
  `outwarehouse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_transfermaster`
--

CREATE TABLE `inv_transfermaster` (
  `id` int(11) NOT NULL,
  `transfer_id` varchar(100) NOT NULL,
  `transfer_date` varchar(100) NOT NULL,
  `from_warehouse` varchar(100) NOT NULL,
  `to_warehouse` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_voucher`
--

CREATE TABLE `inv_voucher` (
  `id` int(11) NOT NULL,
  `voucher_id` varchar(100) NOT NULL,
  `voucher_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_voucherdetails`
--

CREATE TABLE `inv_voucherdetails` (
  `id` int(11) NOT NULL,
  `voucher_id` varchar(100) NOT NULL,
  `voucher_cat` varchar(100) NOT NULL,
  `voucher_type` varchar(100) NOT NULL,
  `voucher_details` varchar(5000) NOT NULL,
  `amount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_voucher_cat`
--

CREATE TABLE `inv_voucher_cat` (
  `id` int(11) NOT NULL,
  `voucher_id` varchar(100) NOT NULL,
  `voucher_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inv_warehosueinfo`
--

CREATE TABLE `inv_warehosueinfo` (
  `id` int(11) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `name` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inv_warehosueinfo`
--

INSERT INTO `inv_warehosueinfo` (`id`, `warehouse_id`, `name`, `short_name`, `project_id`, `address`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'WH-001', 'Port Warehouse', 'CTW', '1', 'Chattogram Port, Chattogram', NULL, 0, '2020-12-14 04:49:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(400) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_details`
--

CREATE TABLE `item_details` (
  `id` int(11) NOT NULL,
  `parent_item_id` int(11) NOT NULL,
  `sub_item_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `item_code` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materialbalance`
--

CREATE TABLE `materialbalance` (
  `id` int(11) NOT NULL,
  `mb_ref_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_materialid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mb_date` date NOT NULL,
  `mbin_qty` float NOT NULL,
  `mbin_val` float NOT NULL,
  `mbout_qty` float NOT NULL,
  `mbout_val` float NOT NULL,
  `mbprice` float NOT NULL,
  `mbtype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbserial` float NOT NULL,
  `mbserial_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mbunit_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jvno` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `part_no` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('backend','frontend') NOT NULL,
  `name` varchar(191) NOT NULL,
  `items` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `view_permission_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL COMMENT 'view_route',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notesheet_access_chain`
--

CREATE TABLE `notesheet_access_chain` (
  `id` int(11) NOT NULL,
  `chain_type` varchar(150) NOT NULL DEFAULT 'default',
  `division_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `notesheet_type` int(11) DEFAULT NULL,
  `users` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notesheet_access_chain`
--

INSERT INTO `notesheet_access_chain` (`id`, `chain_type`, `division_id`, `department_id`, `project_id`, `notesheet_type`, `users`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(24, 'default', 16, 129, 21, 0, '{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}', 1, '2023-09-21 07:55:41', NULL, NULL),
(25, 'default', 16, 130, 21, 0, '{\"3377\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}', 1, '2023-09-21 08:01:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notesheet_roles_group`
--

CREATE TABLE `notesheet_roles_group` (
  `id` int(11) NOT NULL,
  `name` varchar(450) NOT NULL,
  `details` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notesheet_roles_group`
--

INSERT INTO `notesheet_roles_group` (`id`, `name`, `details`) VALUES
(1, 'member', '[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\"]'),
(2, 'acknowledgers', '[\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\",\"g16\"]'),
(3, 'approval', '[\"g17\",\"g18\",\"g19\",\"g20\"]');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - Dashboard , 2 - Email , 3 - Both',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `package_id` varchar(100) NOT NULL,
  `project_id` int(11) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `page_slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `cannonical_link` varchar(191) DEFAULT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `seo_keyword` varchar(191) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent_category`
--

CREATE TABLE `parent_category` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `parent_code` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `permission_category` varchar(60) NOT NULL,
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `permission_category`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'material-list', 'Material List', 'Material', 0, 1, NULL, NULL, NULL, NULL, NULL),
(2, 'material-add', 'Material Entry', 'Material', 0, 1, NULL, NULL, NULL, NULL, NULL),
(3, 'material-edit', 'Material Update', 'Material', 0, 1, NULL, NULL, NULL, NULL, NULL),
(4, 'material-delete', 'Material Delete', 'Material', 0, 1, NULL, NULL, NULL, NULL, NULL),
(5, 'part-no-update', 'Part No Update', 'Material', 0, 1, NULL, NULL, NULL, NULL, NULL),
(6, 'category-list', 'Category List', 'Material Category', 0, 1, NULL, NULL, NULL, NULL, NULL),
(7, 'category-add', 'Category Entry', 'Material Category', 0, 1, NULL, NULL, NULL, NULL, NULL),
(8, 'category-delete', 'Category Delete', 'Material Category', 0, 1, NULL, NULL, NULL, NULL, NULL),
(9, 'unit-list', 'Unit List', 'Material Unit', 0, 1, NULL, NULL, NULL, NULL, NULL),
(10, 'unit-add', 'Unit Entry', 'Material Unit', 0, 1, NULL, NULL, NULL, NULL, NULL),
(11, 'unit-edit', 'Unit Update', 'Material Unit', 0, 1, NULL, NULL, NULL, NULL, NULL),
(12, 'unit-delete', 'Unit Delete', 'Material Unit', 0, 1, NULL, NULL, NULL, NULL, NULL),
(13, 'project-list', 'Project List', 'Projects', 0, 1, NULL, NULL, NULL, NULL, NULL),
(14, 'project-add', 'Project Entry', 'Projects', 0, 1, NULL, NULL, NULL, NULL, NULL),
(15, 'project-edit', 'Project Update', 'Projects', 0, 1, NULL, NULL, NULL, NULL, NULL),
(16, 'project-delete', 'Project Delete', 'Projects', 0, 1, NULL, NULL, NULL, NULL, NULL),
(17, 'warehouse-list', 'Warehouse List', 'Warehouse', 0, 1, NULL, NULL, NULL, NULL, NULL),
(18, 'warehouse-add', 'Warehouse Entry', 'Warehouse', 0, 1, NULL, NULL, NULL, NULL, NULL),
(19, 'warehouse-edit', 'Warehouse Update', 'Warehouse', 0, 1, NULL, NULL, NULL, NULL, NULL),
(20, 'warehouse-delete', 'Warehouse Delete', 'Warehouse', 0, 1, NULL, NULL, NULL, NULL, NULL),
(21, 'equipment-list', 'Equipment List', 'Equipment', 0, 1, NULL, NULL, NULL, NULL, NULL),
(22, 'equipment-add', 'Equipment Entry', 'Equipment', 0, 1, NULL, NULL, NULL, NULL, NULL),
(23, 'equipment-edit', 'Equipment Update', 'Equipment', 0, 1, NULL, NULL, NULL, NULL, NULL),
(24, 'equipment-delete', 'Equipment Delete', 'Equipment', 0, 1, NULL, NULL, NULL, NULL, NULL),
(25, 'opening-stock-list', 'Opening Stock List', 'Opening Stock', 0, 1, NULL, NULL, NULL, NULL, NULL),
(26, 'opening-stock-edit', 'Opening Stock Update', 'Opening Stock', 0, 1, NULL, NULL, NULL, NULL, NULL),
(27, 'material-receive-list', 'Material Receive List', 'Material Receive', 0, 1, NULL, NULL, NULL, NULL, NULL),
(28, 'material-receive-add', 'Material Receive Entry', 'Material Receive', 0, 1, NULL, NULL, NULL, NULL, NULL),
(29, 'material-receive-edit', 'Material Receive Update', 'Material Receive', 0, 1, NULL, NULL, NULL, NULL, NULL),
(30, 'material-receive-delete', 'Material Receive Delete', 'Material Receive', 0, 1, NULL, NULL, NULL, NULL, NULL),
(31, 'material-issue-list', 'Material Issue List', 'Material Issue', 0, 1, NULL, NULL, NULL, NULL, NULL),
(32, 'material-issue-add', 'Material Issue Entry', 'Material Issue', 0, 1, NULL, NULL, NULL, NULL, NULL),
(33, 'material-issue-edit', 'Material Issue Update', 'Material Issue', 0, 1, NULL, NULL, NULL, NULL, NULL),
(34, 'material-issue-delete', 'Material Issue Delete', 'Material Issue', 0, 1, NULL, NULL, NULL, NULL, NULL),
(35, 'user-list', 'User List', 'User', 0, 1, NULL, NULL, NULL, NULL, NULL),
(36, 'user-add', 'User Entry', 'User', 0, 1, NULL, NULL, NULL, NULL, NULL),
(37, 'user-edit', 'User Update', 'User', 0, 1, NULL, NULL, NULL, NULL, NULL),
(38, 'user-profile-update', 'User Profile Update', 'User', 0, 1, NULL, NULL, NULL, NULL, NULL),
(39, 'user-delete', 'User Delete', 'User', 0, 1, NULL, NULL, NULL, NULL, NULL),
(40, 'role-list', 'Role List', 'Role', 0, 1, NULL, NULL, NULL, NULL, NULL),
(41, 'role-add', 'Role Entry', 'Role', 0, 1, NULL, NULL, NULL, NULL, NULL),
(42, 'role-edit', 'Role Update', 'Role', 0, 1, NULL, NULL, NULL, NULL, NULL),
(43, 'role-delete', 'Role Delete', 'Role', 0, 1, NULL, NULL, NULL, NULL, NULL),
(44, 'category-wise-material-list', 'Categorywise Material List', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(45, 'material-stock-report', 'Material Stock Report', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(46, 'material-wise-stock-report', 'Materialwise Stock Report', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(47, 'category-wise-material-stock-report', 'Categorywise material Stock Report', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(48, 'material-movement-report', 'Material Movement Report', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(49, 'equipment-history', 'Equipment History', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(50, 'material-history', 'Material History', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(51, 'material-receive-history', 'Material Receive History', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(52, 'material-issue-history', 'Material Issue History', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(53, 'material-receive-details', 'Material Receive Details', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(54, 'categorywise-material-receive-details', 'Categorywise Material Receive Details', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(55, 'material-issue-details', 'Material Issue Details', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(56, 'categorywise-material-issue-details', 'Categorywise Material Issue Details', 'Material Stock Report', 0, 1, NULL, NULL, NULL, NULL, NULL),
(57, 'material-issue-approve', 'Material Issue Approve', 'Material Issue', 0, 1, NULL, NULL, NULL, NULL, NULL),
(58, 'material-receive-approve', 'Material Receive Approve', 'Material Receive', 0, 1, NULL, NULL, NULL, NULL, NULL),
(59, 'data-backup', 'Data Backup', 'Material', 0, 1, NULL, NULL, NULL, NULL, NULL),
(60, 'log-history', 'Log History', 'Report Part', 0, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(116, 56, 14),
(117, 55, 14),
(118, 54, 14),
(119, 53, 14),
(120, 52, 14),
(121, 51, 14),
(122, 50, 14),
(123, 49, 14),
(124, 48, 14),
(125, 47, 14),
(126, 46, 14),
(127, 45, 14),
(128, 44, 14),
(129, 43, 14),
(131, 41, 14),
(132, 40, 14),
(133, 39, 14),
(134, 38, 14),
(135, 37, 14),
(136, 36, 14),
(137, 35, 14),
(138, 34, 14),
(140, 32, 14),
(141, 31, 14),
(142, 30, 14),
(143, 27, 14),
(144, 26, 14),
(145, 25, 14),
(146, 24, 14),
(147, 23, 14),
(148, 22, 14),
(149, 21, 14),
(150, 20, 14),
(151, 19, 14),
(152, 18, 14),
(153, 17, 14),
(154, 16, 14),
(155, 15, 14),
(156, 14, 14),
(157, 13, 14),
(158, 12, 14),
(159, 11, 14),
(160, 10, 14),
(161, 9, 14),
(162, 8, 14),
(163, 7, 14),
(164, 6, 14),
(165, 5, 14),
(166, 4, 14),
(168, 2, 14),
(170, 29, 14),
(171, 28, 14),
(173, 55, 15),
(174, 54, 15),
(175, 53, 15),
(176, 52, 15),
(177, 51, 15),
(178, 50, 15),
(179, 49, 15),
(180, 48, 15),
(181, 47, 15),
(182, 46, 15),
(184, 44, 15),
(187, 31, 15),
(188, 27, 15),
(197, 3, 14),
(198, 1, 14),
(199, 42, 14),
(201, 32, 15),
(203, 28, 15),
(204, 56, 15),
(205, 45, 15),
(207, 59, 14),
(208, 1, 16),
(209, 58, 16),
(210, 27, 16),
(211, 57, 16),
(212, 31, 16),
(213, 56, 16),
(214, 55, 16),
(215, 54, 16),
(216, 53, 16),
(217, 52, 16),
(218, 51, 16),
(219, 50, 16),
(220, 49, 16),
(221, 48, 16),
(222, 47, 16),
(223, 46, 16),
(224, 45, 16),
(225, 44, 16),
(226, 40, 16),
(227, 35, 16),
(228, 21, 16),
(229, 17, 16),
(230, 13, 16),
(231, 9, 16),
(232, 6, 16),
(235, 60, 14),
(237, 33, 14),
(240, 43, 16),
(241, 42, 16),
(242, 41, 16);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plant_and_equipment`
--

CREATE TABLE `plant_and_equipment` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `equipment_type` int(11) DEFAULT NULL,
  `date_form` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `name` varchar(700) DEFAULT NULL,
  `eel_code` varchar(300) DEFAULT NULL,
  `country_of_origin` varchar(400) DEFAULT NULL,
  `capacity` varchar(300) DEFAULT NULL,
  `make_by` varchar(300) DEFAULT NULL,
  `model` varchar(300) DEFAULT NULL,
  `year_of_manufac` int(11) DEFAULT NULL,
  `present_location` varchar(300) DEFAULT NULL,
  `present_condition` varchar(400) DEFAULT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `present_condition`
--

CREATE TABLE `present_condition` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priority_details`
--

CREATE TABLE `priority_details` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `color_code` varchar(350) NOT NULL,
  `show_order` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `priority_details`
--

INSERT INTO `priority_details` (`id`, `name`, `color_code`, `show_order`) VALUES
(1, 'Urgent', 'danger', 1),
(2, 'High', 'info', 2),
(3, 'Medium', 'warning', 3),
(4, 'Normal', 'success', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(400) DEFAULT NULL,
  `unit_name` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_movement`
--

CREATE TABLE `product_movement` (
  `id` int(11) NOT NULL,
  `movement_no` varchar(500) DEFAULT NULL,
  `entry_date` datetime NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `project_form` int(11) DEFAULT NULL,
  `project_to` int(11) DEFAULT NULL,
  `total_quantity` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `movement_type` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_movement_details`
--

CREATE TABLE `product_movement_details` (
  `id` int(11) NOT NULL,
  `movement_no` varchar(500) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `incharge` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `code`, `name`, `incharge`, `address`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PR-001', 'CTED, Chattogram', 'Lt Commander M Tafsir Uddin Ahmed(Retd)', 'Chattogram Port, Chattogram', NULL, NULL, '2020-12-14 04:48:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_type`
--

CREATE TABLE `project_type` (
  `id` int(11) NOT NULL,
  `name` varchar(600) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rlp_access_chain`
--

CREATE TABLE `rlp_access_chain` (
  `id` int(11) NOT NULL,
  `chain_type` varchar(150) NOT NULL DEFAULT 'default',
  `division_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `rlp_type` int(11) DEFAULT NULL,
  `users` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rlp_access_chain`
--

INSERT INTO `rlp_access_chain` (`id`, `chain_type`, `division_id`, `department_id`, `project_id`, `rlp_type`, `users`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(64, 'default', 16, 130, 21, 0, '{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}', 1, '2023-09-20 11:48:22', NULL, NULL),
(67, 'default', 5, 32, 21, 0, '{\"3374\":\"1\",\"3373\":\"2\",\"3372\":\"3\"}', 1, '2023-09-21 09:37:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rlp_acknowledgement`
--

CREATE TABLE `rlp_acknowledgement` (
  `id` int(11) NOT NULL,
  `rlp_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ack_order` int(11) NOT NULL COMMENT 'acknowledge order to show the RLP',
  `ack_status` tinyint(4) NOT NULL DEFAULT 0,
  `ack_request_date` datetime NOT NULL,
  `ack_updated_date` datetime DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not visible; 1= visible',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rlp_acknowledgement`
--

INSERT INTO `rlp_acknowledgement` (`id`, `rlp_info_id`, `user_id`, `ack_order`, `ack_status`, `ack_request_date`, `ack_updated_date`, `is_visible`, `created_by`, `updated_by`) VALUES
(1332, 1, 3374, 1, 0, '2023-09-21 11:03:55', NULL, 1, 1, NULL),
(1333, 1, 3373, 2, 0, '2023-09-21 11:03:54', NULL, 0, 1, NULL),
(1334, 1, 3372, 3, 0, '2023-09-21 11:03:55', NULL, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rlp_delete_history`
--

CREATE TABLE `rlp_delete_history` (
  `id` int(11) NOT NULL,
  `rlp_info_id` int(11) NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rlp_details`
--

CREATE TABLE `rlp_details` (
  `id` int(11) NOT NULL,
  `rlp_info_id` int(11) NOT NULL,
  `item_des` longtext DEFAULT NULL,
  `purpose` longtext DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `unit` varchar(11) NOT NULL,
  `unit_price` float NOT NULL,
  `amount` float NOT NULL,
  `estimated_price` float DEFAULT NULL,
  `supplier` text DEFAULT NULL,
  `details_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rlp_details`
--

INSERT INTO `rlp_details` (`id`, `rlp_info_id`, `item_des`, `purpose`, `quantity`, `unit`, `unit_price`, `amount`, `estimated_price`, `supplier`, `details_remarks`) VALUES
(1, 1, 'Pendrive', 'office', '1', 'PCS', 800, 800, NULL, '', ''),
(2, 1, 'SSD', 'office', '1', 'PCS', 4000, 4000, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rlp_info`
--

CREATE TABLE `rlp_info` (
  `id` int(11) NOT NULL,
  `rlp_no` varchar(100) NOT NULL,
  `rlp_user_id` int(11) UNSIGNED NOT NULL,
  `rlp_user_office_id` varchar(500) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `request_date` datetime NOT NULL,
  `request_division` int(11) DEFAULT NULL,
  `request_department` int(11) NOT NULL,
  `request_project` int(11) NOT NULL,
  `request_person` varchar(650) DEFAULT NULL,
  `designation` varchar(500) DEFAULT NULL,
  `email` varchar(500) NOT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `user_remarks` text DEFAULT NULL,
  `totalamount` float NOT NULL,
  `rlp_status` tinyint(1) NOT NULL DEFAULT 5,
  `is_viewd` tinyint(1) NOT NULL DEFAULT 0,
  `is_ns` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rlp_info`
--

INSERT INTO `rlp_info` (`id`, `rlp_no`, `rlp_user_id`, `rlp_user_office_id`, `priority`, `request_date`, `request_division`, `request_department`, `request_project`, `request_person`, `designation`, `email`, `contact_number`, `user_remarks`, `totalamount`, `rlp_status`, `is_viewd`, `is_ns`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_delete`) VALUES
(1, 'RLP---2023-09-001', 1, '', 2, '2023-09-21 12:00:00', 5, 32, 21, 'Atiqur Rahman Bhuiyan', '', '', '', 'Okay', 0, 5, 0, 0, 1, '2023-09-21 11:03:54', NULL, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rlp_remarks_history`
--

CREATE TABLE `rlp_remarks_history` (
  `id` int(11) NOT NULL,
  `rlp_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` longtext NOT NULL,
  `remarks_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `show_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `short_name`, `show_order`) VALUES
(1, 'member', 'sa', 1),
(2, 'acknowledgers', 'ak', 0),
(3, 'approval', 'ap', 0),
(4, 'team88', '88', 0),
(5, 'superadmin', 'sa', 0),
(6, 'admin', 'ad', 0),
(7, 'rlp_admin', 'g3', 0),
(8, 'Grade-06', 'g6', 0),
(9, 'Grade-05', 'g5', 0),
(10, 'Grade-17', 'g17', 0),
(11, 'Grade-13', 'g13', 0),
(12, 'Grade-04', 'g4', 0),
(13, 'Grade-14', 'g14', 0),
(14, 'Grade-12', 'g12', 0),
(15, 'Grade-09', 'g9', 0),
(16, 'Grade-18', 'g18', 0),
(17, 'Grade-15', 'g15', 0),
(18, 'Grade-11', 'g11', 0),
(19, 'Grade-16', 'g16', 0),
(20, 'Grade-19', 'g19', 0),
(21, 'Grade-20', 'g20', 0),
(22, 'Grade-17S', 'g17s', 0),
(23, 'Grade-07', 'g7', 0),
(24, 'Grade-08', 'g8', 0),
(25, 'Grade-10', 'g10', 0),
(26, 'rlp_admin', 'g3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles_group`
--

CREATE TABLE `roles_group` (
  `id` int(11) NOT NULL,
  `name` varchar(450) NOT NULL,
  `details` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles_group`
--

INSERT INTO `roles_group` (`id`, `name`, `details`) VALUES
(1, 'member', '[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\"]'),
(2, 'acknowledgers', '[\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\"]'),
(3, 'approval', '[\"g16\",\"g17\",\"g18\",\"g19\",\"g20\"]'),
(4, 'team88', '[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\",\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\"]'),
(5, 'admin', '[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\",\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\",\"g16\",\"g17\",\"g18\",\"g19\",\"g20\"]'),
(6, 'superadmin', '[\"g1\",\"g2\",\"g3\",\"g4\",\"g5\",\"g6\",\"g7\",\"g8\",\"g9\",\"g10\",\"g11\",\"g12\",\"g13\",\"g14\",\"g15\",\"g16\",\"g17\",\"g18\",\"g19\",\"g20\"]');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(600) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `seo_keyword` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `company_contact` varchar(191) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `from_name` varchar(191) DEFAULT NULL,
  `from_email` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `google` varchar(191) DEFAULT NULL,
  `copyright_text` varchar(191) DEFAULT NULL,
  `footer_text` varchar(191) DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `disclaimer` text DEFAULT NULL,
  `google_analytics` text DEFAULT NULL,
  `home_video1` varchar(191) DEFAULT NULL,
  `home_video2` varchar(191) DEFAULT NULL,
  `home_video3` varchar(191) DEFAULT NULL,
  `home_video4` varchar(191) DEFAULT NULL,
  `explanation1` varchar(191) DEFAULT NULL,
  `explanation2` varchar(191) DEFAULT NULL,
  `explanation3` varchar(191) DEFAULT NULL,
  `explanation4` varchar(191) DEFAULT NULL,
  `values` text DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `post_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

CREATE TABLE `social_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(32) NOT NULL,
  `provider_id` varchar(191) NOT NULL,
  `token` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_details`
--

CREATE TABLE `status_details` (
  `id` int(11) NOT NULL,
  `name` varchar(350) NOT NULL,
  `bg_color` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `status_details`
--

INSERT INTO `status_details` (`id`, `name`, `bg_color`) VALUES
(1, 'Approved', '#C3FDB8'),
(2, 'Processing', '#31708f'),
(3, 'Reject', '#a94442'),
(4, 'On Held', '#8a6d3b'),
(5, 'Pending', '#FFDB58'),
(6, 'Recommended', '#00ACD6'),
(7, 'Draft', '#e57817');

-- --------------------------------------------------------

--
-- Table structure for table `sttable`
--

CREATE TABLE `sttable` (
  `id` int(11) NOT NULL,
  `vehicleno` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `registrationno` varchar(150) NOT NULL,
  `tax_issdt` date NOT NULL,
  `tax_expdt` date NOT NULL,
  `fit_issdt` date NOT NULL,
  `fit_expdt` date NOT NULL,
  `ins_issdt` date NOT NULL,
  `ins_expdt` date NOT NULL,
  `rou_issdt` date NOT NULL,
  `rou_expdt` date NOT NULL,
  `engineno` varchar(55) NOT NULL,
  `chasisno` varchar(50) NOT NULL,
  `regdate` date NOT NULL,
  `serialno` varchar(50) NOT NULL,
  `modelno` varchar(50) NOT NULL,
  `ccno` varchar(50) NOT NULL,
  `netvalue` int(11) NOT NULL,
  `sno` int(11) NOT NULL,
  `myear` varchar(50) NOT NULL,
  `office` varchar(75) NOT NULL,
  `division` varchar(79) NOT NULL,
  `location` varchar(80) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `sub_code` varchar(400) NOT NULL,
  `name` varchar(600) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(5000) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `supplier_phone` varchar(100) NOT NULL,
  `supplier_op_balance` varchar(100) NOT NULL,
  `supplier_type` varchar(100) NOT NULL,
  `material_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `code`, `name`, `address`, `contact_person`, `supplier_phone`, `supplier_op_balance`, `supplier_type`, `material_type`) VALUES
(1, 'SID-001', 'Saif Powertec Ltd', '-', '-', '-', '-', 'cash', '47');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payment`
--

CREATE TABLE `supplier_payment` (
  `id` int(11) NOT NULL,
  `voucherid` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `voucherdate` date NOT NULL,
  `supplierid` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paymenttype` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` double NOT NULL,
  `remarks` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sp_photo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(250) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(250) NOT NULL,
  `PostalCode` varchar(30) NOT NULL,
  `Country` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_billpayment`
--

CREATE TABLE `tb_billpayment` (
  `id` int(11) NOT NULL,
  `mr_no` varchar(100) NOT NULL,
  `mr_date` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `accheadname` varchar(100) NOT NULL,
  `debitamount` varchar(100) NOT NULL,
  `creditamount` varchar(100) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `check_no` text NOT NULL,
  `check_date` varchar(100) NOT NULL,
  `job_card_no` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ledger`
--

CREATE TABLE `tb_ledger` (
  `id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `tran_date` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `debit` varchar(100) NOT NULL,
  `credit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_product_receive_data`
--

CREATE TABLE `temp_product_receive_data` (
  `id` int(11) NOT NULL,
  `receive_no` varchar(500) NOT NULL,
  `receive_date` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `part_no` varchar(500) NOT NULL,
  `supplier_id` varchar(250) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` float NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL,
  `project_to_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `userIp` varbinary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `username`, `role_id`, `employee_id`, `userIp`, `loginTime`) VALUES
(4, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 08:55:23'),
(5, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-12 08:55:38'),
(6, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 09:12:44'),
(7, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-12 09:20:35'),
(8, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 09:20:52'),
(9, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-12 09:21:11'),
(10, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 09:28:12'),
(11, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 10:18:09'),
(12, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 10:22:30'),
(13, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 11:01:54'),
(14, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 11:02:38'),
(15, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 11:12:48'),
(16, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 11:43:34'),
(17, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 11:56:33'),
(18, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-12 13:13:23'),
(19, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 03:30:54'),
(20, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 03:35:43'),
(21, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 03:35:44'),
(22, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 06:59:48'),
(23, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-13 07:05:11'),
(24, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 09:28:19'),
(25, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 09:30:51'),
(26, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 09:32:16'),
(27, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 09:50:40'),
(28, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-13 12:17:29'),
(29, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 02:59:02'),
(30, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 03:32:02'),
(31, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 04:00:56'),
(32, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 05:27:55'),
(33, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 06:59:54'),
(34, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 07:00:06'),
(35, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 08:45:41'),
(36, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:44:50'),
(37, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:50:23'),
(38, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:53:51'),
(39, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:54:57'),
(40, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:55:51'),
(41, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:56:32'),
(42, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:56:37'),
(43, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 09:57:40'),
(44, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 10:00:02'),
(45, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 10:21:32'),
(46, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-14 10:22:57'),
(47, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 10:45:36'),
(48, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-14 10:46:36'),
(49, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-14 10:47:07'),
(50, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-15 04:06:06'),
(51, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-15 05:44:41'),
(52, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:12:29'),
(53, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:16:10'),
(54, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:44:56'),
(55, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:44:57'),
(56, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:44:59'),
(57, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:45:43'),
(58, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:48:02'),
(59, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:49:14'),
(60, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:50:17'),
(61, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:51:09'),
(62, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:52:50'),
(63, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:53:13'),
(64, 4, 'Super Admin', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 08:54:04'),
(65, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-15 09:00:34'),
(66, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-15 09:09:39'),
(67, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-17 02:25:23'),
(68, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-17 02:50:45'),
(69, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-17 13:41:53'),
(70, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-18 03:23:47'),
(71, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-18 06:29:17'),
(72, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-18 10:31:13'),
(73, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-19 05:55:16'),
(74, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-19 06:01:34'),
(75, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-19 06:01:57'),
(76, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-19 06:04:38'),
(77, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-19 10:07:28'),
(78, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-19 10:10:52'),
(79, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-19 10:44:11'),
(80, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-20 04:10:14'),
(81, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-20 04:19:15'),
(82, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-20 06:14:41'),
(83, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-20 08:04:47'),
(84, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-20 08:32:15'),
(85, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-20 09:03:47'),
(86, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-20 09:24:05'),
(87, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-20 09:48:45'),
(88, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-20 10:13:50'),
(89, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-20 10:21:45'),
(90, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-20 11:36:05'),
(91, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-20 13:10:46'),
(92, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-20 13:16:11'),
(93, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 03:26:06'),
(94, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-06-21 03:45:07'),
(95, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-21 03:55:19'),
(96, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 03:55:39'),
(97, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 04:10:29'),
(98, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 04:56:36'),
(99, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 04:56:38'),
(100, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 04:56:44'),
(101, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 04:58:10'),
(102, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 04:58:32'),
(103, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 05:18:23'),
(104, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-21 08:34:26'),
(105, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-21 11:19:43'),
(106, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 11:28:09'),
(107, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-21 11:36:05'),
(108, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-21 11:36:56'),
(109, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-21 11:38:06'),
(110, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-22 03:17:56'),
(111, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-22 03:32:42'),
(112, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-22 03:50:53'),
(113, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-22 05:09:38'),
(114, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-22 05:35:45'),
(115, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-22 05:36:03'),
(116, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-22 06:08:54'),
(117, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-22 09:28:15'),
(118, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-22 12:32:15'),
(119, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-24 04:04:14'),
(120, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-24 04:18:29'),
(121, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-25 04:40:12'),
(122, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-06-25 09:46:57'),
(123, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-26 02:34:42'),
(124, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-27 03:46:02'),
(125, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-27 12:00:31'),
(126, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-06-28 04:03:22'),
(127, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-01 04:13:18'),
(128, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-02 03:11:06'),
(129, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-02 10:46:39'),
(130, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-02 12:39:54'),
(131, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-03 02:44:33'),
(132, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-03 10:46:45'),
(133, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-04 03:07:57'),
(134, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-04 11:27:33'),
(135, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-05 02:19:14'),
(136, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-05 06:17:13'),
(137, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-06 04:11:08'),
(138, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-06 07:59:37'),
(139, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-07-06 11:32:10'),
(140, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-08 04:19:28'),
(141, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-08 08:32:18'),
(142, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-09 03:12:09'),
(143, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-09 12:04:25'),
(144, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-10 03:08:45'),
(145, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-10 03:56:41'),
(146, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-10 10:09:37'),
(147, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-11 03:56:12'),
(148, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-12 03:36:41'),
(149, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-12 12:05:09'),
(150, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-13 03:08:21'),
(151, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-07-13 05:05:07'),
(152, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-13 05:08:45'),
(153, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-13 05:08:49'),
(154, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-13 05:32:22'),
(155, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-13 11:32:06'),
(156, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-15 04:09:59'),
(157, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-15 11:18:48'),
(158, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-15 11:18:49'),
(159, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-16 04:22:06'),
(160, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-16 12:06:21'),
(161, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-17 03:54:04'),
(162, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-17 11:47:37'),
(163, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-19 03:25:54'),
(164, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-20 03:17:01'),
(165, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-20 04:19:59'),
(166, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-20 09:27:03'),
(167, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-20 11:02:35'),
(168, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-07-20 11:31:38'),
(169, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-20 12:42:26'),
(170, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-21 11:23:59'),
(171, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-23 02:57:50'),
(172, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-24 03:33:55'),
(173, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-25 03:05:50'),
(174, 4, 'Super Admin', 16, '', 0x3230332e38322e3230372e3831, '2023-07-25 03:28:13'),
(175, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-25 04:20:52'),
(176, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-25 10:07:49'),
(177, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-26 03:04:21'),
(178, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-26 06:04:03'),
(179, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-26 06:31:07'),
(180, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-26 06:31:59'),
(181, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-07-26 08:05:15'),
(182, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-07-26 11:17:59'),
(183, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-29 09:19:03'),
(184, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-30 10:02:25'),
(185, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-31 03:49:05'),
(186, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-07-31 11:33:54'),
(187, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-01 04:28:28'),
(188, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-01 11:26:16'),
(189, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-02 08:38:20'),
(190, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-02 10:21:34'),
(191, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-03 05:40:55'),
(192, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-03 10:23:21'),
(193, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-03 11:52:55'),
(194, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-05 03:36:00'),
(195, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-08 04:20:27'),
(196, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-08 05:53:11'),
(197, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-09 03:13:07'),
(198, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-09 12:22:49'),
(199, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-10 03:46:10'),
(200, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-12 11:44:55'),
(201, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-14 11:58:18'),
(202, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-15 03:19:46'),
(203, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-15 11:40:43'),
(204, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-16 03:22:55'),
(205, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-08-16 05:57:16'),
(206, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-17 04:33:14'),
(207, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-17 05:51:24'),
(208, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-19 02:59:49'),
(209, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-19 11:32:10'),
(210, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-20 08:19:27'),
(211, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-20 11:47:01'),
(212, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-21 05:18:07'),
(213, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-22 06:47:28'),
(214, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-22 09:48:49'),
(215, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-22 10:03:14'),
(216, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-22 10:35:12'),
(217, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-23 03:07:30'),
(218, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-24 03:44:34'),
(219, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-08-24 06:30:04'),
(220, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-24 12:40:03'),
(221, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-26 02:47:56'),
(222, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-27 03:36:47'),
(223, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-27 03:53:10'),
(224, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-08-27 04:02:48'),
(225, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-27 04:42:35'),
(226, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-08-27 06:57:12'),
(227, 1, 'Admin CTED', 14, '', 0x3230332e38322e3230372e3831, '2023-08-27 11:19:55'),
(228, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-27 11:34:22'),
(229, 8, 'User Mamun', 15, '', 0x3230332e38322e3230372e3831, '2023-08-28 03:06:10'),
(230, 7, 'User Zilani', 15, '', 0x3230332e38322e3230372e3831, '2023-08-28 03:39:37'),
(231, 7, 'User Zilani', 15, '', 0x3a3a31, '2023-08-28 10:52:24'),
(232, 7, 'User Zilani', 15, '', 0x3a3a31, '2023-08-29 03:29:46'),
(233, 1, 'Admin CTED', 14, '', 0x3a3a31, '2023-08-30 03:20:30'),
(234, 1, 'Admin CTED', 14, '', 0x3a3a31, '2023-09-03 03:44:57'),
(235, 1, 'Admin INV', 14, '', 0x3a3a31, '2023-09-03 03:56:53'),
(236, 1, 'Admin INV', 14, '', 0x3a3a31, '2023-09-04 03:46:05'),
(237, 1, 'Admin INV', 14, '', 0x3a3a31, '2023-09-05 03:38:18'),
(238, 1, 'Admin INV', 14, '', 0x3a3a31, '2023-09-07 03:32:17'),
(239, 1, 'Admin INV', 14, '', 0x3a3a31, '2023-09-19 04:56:14'),
(240, 1, 'Admin INV', 14, '', 0x3a3a31, '2023-09-19 06:06:37'),
(241, 1, 'Admin INV', 14, '', 0x3a3a31, '2023-09-20 03:31:05'),
(242, 1, ' ', 1, '', 0x3a3a31, '2023-09-20 03:41:06'),
(243, 1, '88i Admin', 1, '', 0x3a3a31, '2023-09-20 03:42:01'),
(244, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-20 03:42:53'),
(245, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-20 08:56:26'),
(246, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-21 03:51:52'),
(247, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-21 05:00:11'),
(248, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-21 08:32:10'),
(249, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-21 10:10:11'),
(250, 3374, ' ', 3, '', 0x3a3a31, '2023-09-21 11:03:33'),
(251, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-21 11:06:29'),
(252, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-24 04:10:45'),
(253, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-24 08:59:17'),
(254, 1, '88i Admin', 14, '', 0x3a3a31, '2023-09-26 03:33:08'),
(255, 1, '88i Admin', 14, '', 0x3a3a31, '2023-10-01 06:08:37'),
(256, 1, '88i Admin', 14, '', 0x3a3a31, '2023-10-01 06:25:22'),
(257, 1, '88i Admin', 14, '', 0x3a3a31, '2023-10-01 10:50:01'),
(258, 1, '88i Admin', 14, '', 0x3a3a31, '2023-10-04 11:27:49'),
(259, 1, '88i Admin', 14, '', 0x3a3a31, '2023-10-05 03:36:46'),
(260, 1, '88i Admin', 14, '', 0x3a3a31, '2023-10-12 06:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `office_id` varchar(550) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `store_id` int(11) NOT NULL,
  `designation` varchar(650) DEFAULT NULL,
  `role_name` varchar(250) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `profile_image` varchar(650) DEFAULT NULL,
  `signature_image` varchar(550) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_password_changed` tinyint(1) NOT NULL DEFAULT 0,
  `is_status` tinyint(1) NOT NULL DEFAULT 1,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branch_id`, `department_id`, `project_id`, `office_id`, `role_id`, `type`, `store_id`, `designation`, `role_name`, `name`, `email`, `contact_number`, `profile_image`, `signature_image`, `password`, `is_password_changed`, `is_status`, `first_name`, `last_name`, `user_type`, `warehouse_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 16, 131, 21, 'SA-000001', 14, '6', 1, '10', 'sa', '88 IT Admin', 'admin@admin.com', NULL, '', '16919031921667818730Nahid-Hasan-Sign1.png', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '88i', 'Admin', 'admin', 0, 0, '2020-03-16 09:03:06', 1, '2023-08-13 05:06:32'),
(3372, 16, 131, 21, 'IEL-000002', 21, '3', 0, '112', 'g20', 'Tarafder Md Ruhul Saif', 's@gmail.com', NULL, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '', '', '', 0, 0, '2023-07-30 04:56:08', NULL, NULL),
(3373, 16, 131, 21, 'IEL-000005', 13, '2', 0, '15', 'g14', 'Md Jobaer Kabir', 'jk@gmail.com', NULL, NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '', '', '', 0, 0, '2023-07-30 04:56:41', NULL, NULL),
(3374, 16, 129, 21, 'IEL-000020', 3, '2', 0, '2', 'g10', 'Md. Babul Farajee', 'bf@gmail.com', NULL, NULL, '16919032131669633451Zakir-Hussain-handwritten-signature-500x340-removebg-preview.png', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', '', '', 0, 0, '2023-07-30 04:57:40', 1, '2023-08-13 05:06:53'),
(3375, 16, 130, 21, 'IEL-000017', 5, '1', 0, '1', 'g8', 'Atiqur Rahman Bhuiyan', 'a@gmail.com', '01729714503', NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '', '', '', 0, 0, '2023-07-30 05:09:21', 1, '2023-07-31 19:39:06'),
(3377, 16, 130, 21, 'IEL-000016', 18, '2', 0, '2', 'g11', 'Muhammed Fakhrul Islam', 'fp@gmail.com', '123456', NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', 0, 1, '', '', '', 0, 0, '2023-07-31 19:41:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users2`
--

CREATE TABLE `users2` (
  `id` int(11) NOT NULL,
  `id2` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `confirmation_code` varchar(191) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `is_term_accept` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 0 = not accepted,1 = accepted',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users2`
--

INSERT INTO `users2` (`id`, `id2`, `first_name`, `last_name`, `user_type`, `project_id`, `warehouse_id`, `role_id`, `email`, `password`, `status`, `confirmation_code`, `confirmed`, `is_term_accept`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Admin', 'INV', 'admin', '1', '1', 14, 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 'b1970adb3f301c8440c81e45b526060c', 1, 0, 'PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr', 1, 1, '2019-01-14 00:17:02', '2019-01-20 20:36:38', NULL),
(4, 4, 'Super', 'Admin', 'superAdmin', '1', '1', 16, 'superadmin@admin.com', 'be05977add575832dc52655d4ad5c42e', 1, 'b1970adb3f301c8440c81e45b526060c', 1, 0, 'PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr', 4, 4, NULL, NULL, NULL),
(7, 1, 'User', 'Zilani', 'whm', '1', '1', 15, 'zilani@cted.com', 'dbe174b9745efb86baea199a90cb4a81', 1, 'b1970adb3f301c8440c81e45b526060c', 1, 0, 'PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr', 1, 1, '2019-01-14 00:17:02', '2019-01-20 20:36:38', NULL),
(8, 1, 'User', 'Mamun', 'whm', '1', '1', 15, 'mamun@cted.com', '43406defbf583b87cb4eb008d0a7fc95', 1, 'b1970adb3f301c8440c81e45b526060c', 1, 0, 'PCgsDtfHhHDhADntGcj7D97A9e4U0gtx0hlLn2heuaMyQBq5Gaa2sP55BPGr', 1, 1, '2019-01-14 00:17:02', '2019-01-20 20:36:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complain_type`
--
ALTER TABLE `complain_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_challan`
--
ALTER TABLE `inv_challan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_complain`
--
ALTER TABLE `inv_complain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_complaindetails`
--
ALTER TABLE `inv_complaindetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_designation`
--
ALTER TABLE `inv_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_employee`
--
ALTER TABLE `inv_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_invoice`
--
ALTER TABLE `inv_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_invoice_details`
--
ALTER TABLE `inv_invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_issue`
--
ALTER TABLE `inv_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_issuedetail`
--
ALTER TABLE `inv_issuedetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_item_unit`
--
ALTER TABLE `inv_item_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_job_card`
--
ALTER TABLE `inv_job_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_job_card_details`
--
ALTER TABLE `inv_job_card_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_material`
--
ALTER TABLE `inv_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_materialbalance`
--
ALTER TABLE `inv_materialbalance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_materialcategory`
--
ALTER TABLE `inv_materialcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_materialcategorysub`
--
ALTER TABLE `inv_materialcategorysub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_material_level3`
--
ALTER TABLE `inv_material_level3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_material_level4`
--
ALTER TABLE `inv_material_level4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_material_partno_detail`
--
ALTER TABLE `inv_material_partno_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_particulars`
--
ALTER TABLE `inv_particulars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_particulars_type`
--
ALTER TABLE `inv_particulars_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_product_price`
--
ALTER TABLE `inv_product_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_purchase`
--
ALTER TABLE `inv_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_purchasedetail`
--
ALTER TABLE `inv_purchasedetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_receive`
--
ALTER TABLE `inv_receive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_receivedetail`
--
ALTER TABLE `inv_receivedetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_return`
--
ALTER TABLE `inv_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_returndetail`
--
ALTER TABLE `inv_returndetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_serviceinvoice`
--
ALTER TABLE `inv_serviceinvoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_supplier`
--
ALTER TABLE `inv_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_supplierbalance`
--
ALTER TABLE `inv_supplierbalance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_technicianinfo`
--
ALTER TABLE `inv_technicianinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_tranferdetail`
--
ALTER TABLE `inv_tranferdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_transfermaster`
--
ALTER TABLE `inv_transfermaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_voucher`
--
ALTER TABLE `inv_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_voucherdetails`
--
ALTER TABLE `inv_voucherdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_voucher_cat`
--
ALTER TABLE `inv_voucher_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inv_warehosueinfo`
--
ALTER TABLE `inv_warehosueinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materialbalance`
--
ALTER TABLE `materialbalance`
  ADD KEY `id` (`id`);

--
-- Indexes for table `notesheet_access_chain`
--
ALTER TABLE `notesheet_access_chain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notesheet_roles_group`
--
ALTER TABLE `notesheet_roles_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priority_details`
--
ALTER TABLE `priority_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rlp_access_chain`
--
ALTER TABLE `rlp_access_chain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rlp_acknowledgement`
--
ALTER TABLE `rlp_acknowledgement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rlp_info_id` (`rlp_info_id`);

--
-- Indexes for table `rlp_delete_history`
--
ALTER TABLE `rlp_delete_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rlp_info_id` (`rlp_info_id`);

--
-- Indexes for table `rlp_details`
--
ALTER TABLE `rlp_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rlp_info_id` (`rlp_info_id`);

--
-- Indexes for table `rlp_info`
--
ALTER TABLE `rlp_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rlp_user_id` (`rlp_user_id`);

--
-- Indexes for table `rlp_remarks_history`
--
ALTER TABLE `rlp_remarks_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rlp_info_id` (`rlp_info_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_group`
--
ALTER TABLE `roles_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_details`
--
ALTER TABLE `status_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sttable`
--
ALTER TABLE `sttable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `tb_billpayment`
--
ALTER TABLE `tb_billpayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_ledger`
--
ALTER TABLE `tb_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users2`
--
ALTER TABLE `users2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `complain_type`
--
ALTER TABLE `complain_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `inv_challan`
--
ALTER TABLE `inv_challan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_complain`
--
ALTER TABLE `inv_complain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_complaindetails`
--
ALTER TABLE `inv_complaindetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_designation`
--
ALTER TABLE `inv_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_employee`
--
ALTER TABLE `inv_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_invoice`
--
ALTER TABLE `inv_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_invoice_details`
--
ALTER TABLE `inv_invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_issue`
--
ALTER TABLE `inv_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inv_issuedetail`
--
ALTER TABLE `inv_issuedetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inv_item_unit`
--
ALTER TABLE `inv_item_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `inv_job_card`
--
ALTER TABLE `inv_job_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_job_card_details`
--
ALTER TABLE `inv_job_card_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_material`
--
ALTER TABLE `inv_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inv_materialbalance`
--
ALTER TABLE `inv_materialbalance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inv_materialcategory`
--
ALTER TABLE `inv_materialcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_materialcategorysub`
--
ALTER TABLE `inv_materialcategorysub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `inv_material_level3`
--
ALTER TABLE `inv_material_level3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_material_level4`
--
ALTER TABLE `inv_material_level4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_material_partno_detail`
--
ALTER TABLE `inv_material_partno_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inv_particulars`
--
ALTER TABLE `inv_particulars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_particulars_type`
--
ALTER TABLE `inv_particulars_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_product_price`
--
ALTER TABLE `inv_product_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inv_purchase`
--
ALTER TABLE `inv_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_purchasedetail`
--
ALTER TABLE `inv_purchasedetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_receive`
--
ALTER TABLE `inv_receive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inv_receivedetail`
--
ALTER TABLE `inv_receivedetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inv_return`
--
ALTER TABLE `inv_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_returndetail`
--
ALTER TABLE `inv_returndetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_serviceinvoice`
--
ALTER TABLE `inv_serviceinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_supplier`
--
ALTER TABLE `inv_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_supplierbalance`
--
ALTER TABLE `inv_supplierbalance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inv_technicianinfo`
--
ALTER TABLE `inv_technicianinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_tranferdetail`
--
ALTER TABLE `inv_tranferdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_transfermaster`
--
ALTER TABLE `inv_transfermaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_voucher`
--
ALTER TABLE `inv_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_voucherdetails`
--
ALTER TABLE `inv_voucherdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_voucher_cat`
--
ALTER TABLE `inv_voucher_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inv_warehosueinfo`
--
ALTER TABLE `inv_warehosueinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materialbalance`
--
ALTER TABLE `materialbalance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notesheet_access_chain`
--
ALTER TABLE `notesheet_access_chain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notesheet_roles_group`
--
ALTER TABLE `notesheet_roles_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `priority_details`
--
ALTER TABLE `priority_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rlp_access_chain`
--
ALTER TABLE `rlp_access_chain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `rlp_acknowledgement`
--
ALTER TABLE `rlp_acknowledgement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1335;

--
-- AUTO_INCREMENT for table `rlp_delete_history`
--
ALTER TABLE `rlp_delete_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rlp_details`
--
ALTER TABLE `rlp_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1503;

--
-- AUTO_INCREMENT for table `rlp_info`
--
ALTER TABLE `rlp_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `rlp_remarks_history`
--
ALTER TABLE `rlp_remarks_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=782;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `roles_group`
--
ALTER TABLE `roles_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status_details`
--
ALTER TABLE `status_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sttable`
--
ALTER TABLE `sttable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_billpayment`
--
ALTER TABLE `tb_billpayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ledger`
--
ALTER TABLE `tb_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3378;

--
-- AUTO_INCREMENT for table `users2`
--
ALTER TABLE `users2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
